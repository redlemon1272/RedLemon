import { createClient } from '@supabase/supabase-js';
import fetch from 'node-fetch';
import { addSeconds, startOfDay } from 'date-fns';

// --- Configuration ---
const SUPABASE_URL = process.env.SUPABASE_URL || '';
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_KEY || '';
const BUFFER_BETWEEN_MOVIES = 600; // 10 minutes in seconds

if (!SUPABASE_URL || !SUPABASE_KEY) {
  console.error('❌ Missing Supabase configuration');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

interface Movie {
  id: string;
  name: string;
  poster: string;
  background?: string;
  logo?: string;
  description?: string;
  year?: string;
  imdbRating?: string;
  runtime?: string; // e.g. "148 min"
  genres?: string[];
}

interface ScheduledEvent {
  movieId: string;
  startTime: Date;
  duration: number; // seconds
  movie: Movie;
}

// --- State ---
let currentMovies: Movie[] = [];
let currentSchedule: ScheduledEvent[] = [];
let lastFetchTime: Date | null = null;

// --- Logic ---

async function fetchTopMovies(): Promise<Movie[]> {
  console.log('🎬 Fetching top movies from Cinemeta...');
  try {
    const response = await fetch('https://v3-cinemeta.strem.io/catalog/movie/top/skip=0.json');
    const data: any = await response.json();
    
    // Filter 1998-2023
    const movies = data.metas.filter((m: any) => {
      const year = parseInt(m.year?.substring(0, 4) || '0');
      return year >= 1998 && year <= 2023;
    }).slice(0, 10); // Take top 10

    console.log(`✅ Fetched ${movies.length} movies`);
    return movies;
  } catch (err) {
    console.error('❌ Failed to fetch movies:', err);
    return [];
  }
}

function parseRuntime(runtimeStr?: string): number {
  if (!runtimeStr) return 7200; // Default 2 hours
  const minutes = parseInt(runtimeStr.split(' ')[0]) || 120;
  return minutes * 60;
}

function calculateSchedule(movies: Movie[]): ScheduledEvent[] {
  const now = new Date();
  const midnight = startOfDay(now);
  let cumulativeTime = 0;
  
  return movies.map(movie => {
    const duration = parseRuntime(movie.runtime);
    const startTime = addSeconds(midnight, cumulativeTime);
    cumulativeTime += duration + BUFFER_BETWEEN_MOVIES;
    
    return {
      movieId: movie.id,
      startTime,
      duration,
      movie
    };
  });
}

async function ensureRoomExists(event: ScheduledEvent) {
  const roomId = `EVENT-${event.movieId}`;
  
  // Check if room exists
  const { data: existing } = await supabase
    .from('rooms')
    .select('id')
    .eq('id', roomId)
    .single();
    
  if (!existing) {
    console.log(`Creating room for ${event.movie.name}...`);
    await supabase.from('rooms').insert({
      id: roomId,
      host_user_id: 'system',
      host_username: 'RedLemon System',
      imdb_id: event.movieId,
      name: event.movie.name,
      poster_url: event.movie.poster,
      backdrop_url: event.movie.background,
      is_playing: true, // Always playing
      created_at: event.startTime.toISOString(),
      status: 'playing'
    });
  }
}

async function deleteRoom(movieId: string) {
  const roomId = `EVENT-${movieId}`;
  await supabase.from('rooms').delete().eq('id', roomId);
  console.log(`🗑️ Deleted room ${roomId}`);
}

async function manageRooms() {
  const now = new Date();
  
  // Refresh movies if needed (daily or on loop completion - simplified to daily for now)
  if (!lastFetchTime || now.getDate() !== lastFetchTime.getDate()) {
    currentMovies = await fetchTopMovies();
    currentSchedule = calculateSchedule(currentMovies);
    lastFetchTime = now;
  }
  
  for (const event of currentSchedule) {
    const timeUntilStart = event.startTime.getTime() - now.getTime();
    const timeUntilEnd = (event.startTime.getTime() + event.duration * 1000) - now.getTime();
    const bufferEnd = timeUntilEnd + (15 * 60 * 1000); // Keep room for 15 mins after
    
    if (timeUntilStart <= 0 && bufferEnd > 0) {
      // Active
      await ensureRoomExists(event);
    } else if (bufferEnd <= 0) {
      // Ended
      await deleteRoom(event.movieId);
    }
  }
}

// --- Main Loop ---
console.log('🚀 Events Worker Starting...');
setInterval(manageRooms, 5 * 60 * 1000); // Run every 5 mins
manageRooms(); // Run immediately
