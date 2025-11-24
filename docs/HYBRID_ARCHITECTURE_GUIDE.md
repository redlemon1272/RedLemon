# RedLemon Hybrid Architecture Guide
## Self-Hosted Supabase + Global Latency Optimization + Clustered Events

**Purpose:** Complete guide for migrating to self-hosted Supabase, optimizing global latency, and implementing scalable "Clustered Events" for massive watch parties.

**Created:** November 23, 2025  
**Updated:** November 24, 2025
**Status:** Ready for Implementation  

---

## 🎯 Executive Summary

This guide implements a comprehensive architecture that solves three critical problems:

1.  **Infrastructure Control**: Self-hosting Supabase to remove platform limits.
2.  **Global Performance**: Using relay nodes to optimize latency for international users.
3.  **Social Scalability**: Implementing "Clustered Events" to handle thousands of concurrent viewers while maintaining intimate, readable chat rooms.

---

## 🏗️ Part 1: Infrastructure & Latency

### Current State (Working)
```
RedLemon Client → Supabase Hosted (US) → uWebSockets.js (AnonVM NL)
```

### Target State (Optimal)
```
                  ┌─────────────────────┐
                  │   Self-Hosted       │
                  │   Supabase          │
                  │   + uWebSockets.js  │
                  │   (AnonVM NL)       │
                  └─────────┬───────────┘
                            │
            ┌───────────────┼───────────────┐
            │               │               │
    ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
    │ US Relay     │ │ Canada Relay│ │ Direct EU  │
    │ ($5-10/mo)   │ │ ($5-10/mo)  │ │ Connection │
    └───────┬──────┘ └──────┬──────┘ └────────────┘
            │               │               │
            └───────────────┼───────────────┘
                            │
                    ┌───────▼───────┐
                    │ Global Clients│
                    └───────────────┘
```

### Data Flow
- **EU Clients**: Direct to AnonVM (20-40ms)
- **NA Clients**: Via relay → AnonVM (60-80ms total, vs 150-200ms direct)
- **All Auth/Persistence**: Self-hosted Supabase on AnonVM
- **Real-time Sync**: uWebSockets.js on AnonVM (proxied through relays)

---

## 👥 Part 2: Clustered Events Architecture

### The Problem: "The Stadium Paradox"
If 10,000 people join a single event:
- **Technical Failure**: 10,000 WebSocket connections broadcasting to each other = 100,000,000 messages/sec.
- **Social Failure**: Chat becomes an unreadable blur. No sense of community.

### The Solution: "Event Rooms + Broadcast Timeline"
We separate the **Content Timeline** (Global) from the **Social Experience** (Local).

#### 1. Global Timeline (The "Broadcast")
A single source of truth for *what* is playing and *when*.
- **State**: `{ "movieId": "tt1234567", "startTime": "2025-11-24T20:00:00Z" }`
- **Scale**: Infinite. Clients just calculate `Date.now() - startTime`.
- **Sync**: Deterministic. No server load per user.

#### 2. Local Clusters (The "Rooms")
Users are automatically distributed into small, intimate rooms (Clusters) of ~30-50 people.
- **Experience**: "I'm watching with 29 other people."
- **Chat**: Readable, meaningful, intimate.
- **Load**: Tiny. Each Supabase Realtime channel only handles 30 users.

### Architecture Diagram

```mermaid
graph TD
    User[User Joins Event] --> Allocator[Room Allocator (Edge Function)]
    
    Allocator -->|Check Capacity| DB[(Supabase DB)]
    
    subgraph "Event: John Wick 4"
        GlobalState[Global Timeline State]
        
        subgraph "Cluster A (Full)"
            RoomA[Room #1]
            UsersA[30/30 Users]
        end
        
        subgraph "Cluster B (Active)"
            RoomB[Room #2]
            UsersB[12/30 Users]
        end
        
        subgraph "Cluster C (Empty)"
            RoomC[Room #3]
            UsersC[0/30 Users]
        end
    end
    
    Allocator -->|Assign| RoomB
    
    RoomA -.->|Syncs Time| GlobalState
    RoomB -.->|Syncs Time| GlobalState
    RoomC -.->|Syncs Time| GlobalState
```

### 🔧 Implementation Details

#### 1. Database Schema Updates

**`events` table** (Global State)
```sql
create table events (
  id uuid primary key default uuid_generate_v4(),
  movie_id text not null,
  start_time timestamptz not null,
  status text check (status in ('scheduled', 'live', 'ended')),
  total_viewers int default 0
);
```

**`event_rooms` table** (Clusters)
```sql
create table event_rooms (
  id uuid primary key default uuid_generate_v4(),
  event_id uuid references events(id),
  room_number int not null,
  viewer_count int default 0,
  max_viewers int default 30,
  is_full boolean default false,
  created_at timestamptz default now()
);
```

#### 2. Room Assignment Algorithm (Edge Function)
When a user clicks "Join Event":

1.  **Query**: Find `event_rooms` where `event_id = X` AND `is_full = false` ORDER BY `room_number` ASC LIMIT 1.
2.  **If Found**: 
    *   Increment `viewer_count`.
    *   If `viewer_count >= max_viewers`, set `is_full = true`.
    *   Return `room_id`.
3.  **If Not Found**:
    *   Create new room (e.g., Room #4).
    *   Set `viewer_count = 1`.
    *   Return `new_room_id`.

#### 3. Client-Side Logic (Swift)

**Joining:**
```swift
let allocation = try await supabase.functions.invoke("join-event", body: ["eventId": event.id])
let roomId = allocation.roomId
let roomNumber = allocation.roomNumber

print("🎟️ Ticket assigned: Room #\(roomNumber)")
// Connect to specific channel
let channel = supabase.realtime.channel("room_\(roomId)")
```

**Playback:**
```swift
// Ignore room state for playback! Use Global Timeline.
let timeSinceStart = Date().timeIntervalSince(event.startTime)
player.seek(to: timeSinceStart)
```

**Chat:**
```swift
// Send messages only to your room channel
channel.send("broadcast", { "event": "chat", "payload": { "msg": "Whoa!" } })
```

### 🚀 Scalability Analysis

| Metric | Single Room (Old) | Clustered (New) |
| :--- | :--- | :--- |
| **1,000 Users** | 1,000 connections to 1 channel | 34 rooms x 30 users |
| **Message Rate** | 1000 msg/sec (Unreadable) | 1 msg/sec per room (Readable) |
| **Server Load** | O(N^2) broadcast complexity | O(N) linear scaling |
| **User Experience** | Chaos, Spam, Lag | Intimate, Social, Fast |

---

## 📋 Implementation Plan (Combined)

### Phase 1: Self-Hosted Supabase (Week 1-2)
- [ ] Deploy Supabase on AnonVM
- [ ] Migrate database from hosted
- [ ] Update client configuration
- [ ] Test authentication and data access

### Phase 2: Relay Node Setup (Week 3)
- [ ] Provision US relay server
- [ ] Configure WebSocket proxy
- [ ] Set up SSL certificates
- [ ] Test connection and performance

### Phase 3: Clustered Events Logic (Week 4)
- [ ] Create `events` and `event_rooms` tables
- [ ] Write "Room Allocator" Edge Function
- [ ] Update `EventsView` to call Allocator
- [ ] Update `LobbyViewModel` to support assigned rooms

### Phase 4: Client-Side Routing (Week 5)
- [ ] Implement geographic detection
- [ ] Add smart connection logic
- [ ] Update WebSocket connection code
- [ ] Test regional performance

---

## 🛠️ Phase 1: Self-Hosted Supabase Setup
*(See previous section for detailed Docker commands)*

## 🌐 Phase 2: Relay Node Implementation
*(See previous section for detailed Caddy/Nginx config)*

## 🧩 Phase 3: Clustered Events Implementation

### 3.1 Database Migration
```sql
-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- Events Table
create table public.events (
    id uuid primary key default uuid_generate_v4(),
    imdb_id text not null,
    title text not null,
    start_time timestamptz not null,
    duration_seconds int not null,
    status text default 'scheduled' check (status in ('scheduled', 'live', 'ended')),
    created_at timestamptz default now()
);

-- Event Rooms (Clusters)
create table public.event_rooms (
    id uuid primary key default uuid_generate_v4(),
    event_id uuid references public.events(id) on delete cascade,
    room_number int not null,
    current_viewers int default 0,
    max_viewers int default 50, -- Configurable cluster size
    is_full boolean default false,
    created_at timestamptz default now(),
    unique(event_id, room_number)
);

-- Indexes for fast allocation
create index idx_event_rooms_allocation on event_rooms(event_id, is_full, room_number);
```

### 3.2 Room Allocator (Supabase Edge Function)
*Path: `supabase/functions/join-event/index.ts`*

```typescript
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

serve(async (req) => {
  const { eventId, userId } = await req.json()
  
  // Initialize Admin Client
  const supabase = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  )

  // 1. Try to find an open room
  const { data: rooms, error } = await supabase
    .from('event_rooms')
    .select('*')
    .eq('event_id', eventId)
    .eq('is_full', false)
    .order('room_number', { ascending: true })
    .limit(1)

  let targetRoom;

  if (rooms && rooms.length > 0) {
    // Join existing room
    targetRoom = rooms[0]
    
    // Increment viewer count (Atomic update)
    const { data: updated } = await supabase.rpc('increment_viewer_count', { 
      row_id: targetRoom.id 
    })
    
  } else {
    // Create new room
    // Get last room number
    const { data: lastRoom } = await supabase
      .from('event_rooms')
      .select('room_number')
      .eq('event_id', eventId)
      .order('room_number', { ascending: false })
      .limit(1)
      .single()
      
    const nextNumber = (lastRoom?.room_number ?? 0) + 1
    
    const { data: newRoom, error: createError } = await supabase
      .from('event_rooms')
      .insert({
        event_id: eventId,
        room_number: nextNumber,
        current_viewers: 1
      })
      .select()
      .single()
      
    targetRoom = newRoom
  }

  return new Response(
    JSON.stringify({ 
      roomId: targetRoom.id,
      roomNumber: targetRoom.room_number,
      channelId: `event_${eventId}_room_${targetRoom.room_number}`
    }),
    { headers: { "Content-Type": "application/json" } },
  )
})
```

### 3.3 Database Function (Atomic Increment)
```sql
create or replace function increment_viewer_count(row_id uuid)
returns void as $$
begin
  update event_rooms
  set 
    current_viewers = current_viewers + 1,
    is_full = (current_viewers + 1) >= max_viewers
  where id = row_id;
end;
$$ language plpgsql;
```

---

## 💰 Cost Analysis (Updated)

### Monthly Breakdown
```
AnonVM (NL):           $15-25/month (Core + DB)
US Relay Server:       $5-10/month  
Canada Relay Server:   $5-10/month (Optional)
Domain Names:          $2-3/month
Supabase Self-Hosted:  $0 (Included in AnonVM)
Edge Functions:        $0 (Self-hosted via Deno)
---------------------------------------------
Total:                  $22-38/month
```

### Scale Capacity
- **Concurrent Users**: ~10,000+ (limited only by AnonVM CPU/RAM)
- **Chat Rooms**: Unlimited (horizontal scaling)
- **Bandwidth**: Minimal (Client-P2P for streaming, only signaling via server)

---

## 🚀 Go-Live Checklist

### Pre-Migration
- [ ] Complete Supabase self-hosting setup
- [ ] Deploy at least one relay node
- [ ] Deploy "Room Allocator" Edge Function
- [ ] Update client to use Allocator for events

### Migration Day
- [ ] Backup hosted Supabase data
- [ ] Update DNS records
- [ ] Deploy new client version
- [ ] Monitor room allocation logic

### Post-Migration
- [ ] Monitor "Room Full" rates
- [ ] Adjust `max_viewers` based on feedback (30 vs 50 vs 100)
- [ ] Optimize relay locations
