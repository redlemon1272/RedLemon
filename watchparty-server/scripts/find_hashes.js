const https = require('https');

const SHOWS = [
    {
        name: "Breaking Bad",
        imdbId: "tt0903747",
        query: "Breaking Bad S01-S05 1080p NF WEB-DL AV1 EAC3 MultiSub",
        matcher: (title) => {
            const t = title.toLowerCase();
            return t.includes("breaking bad") &&
                   (t.includes("s01-s05") || t.includes("season 5") || t.includes("complete")) &&
                   t.includes("1080p") &&
                   t.includes("nf") &&
                   (t.includes("av1") || t.includes("web-dl"));
        }
    },
    {
        name: "The Office",
        imdbId: "tt0386676",
        query: "The Office US 2005-2013 [S01-S09] [1080p.NF.WEB-DL.x264-FT]",
        matcher: (title) => {
            const t = title.toLowerCase();
            const q = "The Office US 2005-2013 [S01-S09] [1080p.NF.WEB-DL.x264-FT]".toLowerCase();
            // The query string in code might be slightly different from title format
            // Let's try to match key parts if exact match fails
            if (t.includes(q)) return true;
            return t.includes("the office") && t.includes("s01-s09") && t.includes("ft");
        }
    },
    {
        name: "Friends",
        imdbId: "tt0108778",
        query: "Friends TV Series 720p Seasons 1-10 Complete + Subs maximersk",
        matcher: (title) => {
            const t = title.toLowerCase();
            const q = "Friends TV Series 720p Seasons 1-10 Complete + Subs maximersk".toLowerCase();
            if (t.includes(q)) return true;
            return t.includes("friends") && t.includes("seasons 1-10") && t.includes("maximersk");
        }
    },
    {
        name: "Game of Thrones",
        imdbId: "tt0944947",
        query: "Game.of.Thrones.S01-S08.COMPLETE.SERIES.REPACK.1080p.Bluray.x265-HiQVE",
        matcher: (title) => {
            const t = title.toLowerCase();
            return (t.includes("game of thrones") || t.includes("game.of.thrones")) &&
                   t.includes("hiqve") &&
                   t.includes("1080p");
        }
    }
];

function fetchStreams(imdbId) {
    return new Promise((resolve, reject) => {
        // Use public Torrentio endpoint
        const url = `https://torrentio.strem.fun/stream/series/${imdbId}:1:1.json`;
        console.log(`Fetching ${url}...`);
        
        https.get(url, (res) => {
            let data = '';
            res.on('data', (chunk) => data += chunk);
            res.on('end', () => {
                try {
                    const json = JSON.parse(data);
                    resolve(json.streams || []);
                } catch (e) {
                    reject(e);
                }
            });
        }).on('error', (e) => reject(e));
    });
}

async function main() {
    console.log("Searching for trusted pack hashes...");
    
    for (const show of SHOWS) {
        try {
            const streams = await fetchStreams(show.imdbId);
            console.log(`Found ${streams.length} streams for ${show.name}`);
            
            const match = streams.find(s => {
                // Torrentio title usually includes newlines and details
                // We check the first line (title) usually
                const title = s.title || "";
                return show.matcher(title);
            });
            
            if (match) {
                console.log(`✅ MATCH for ${show.name}:`);
                console.log(`   Title: ${match.title.split('\n')[0]}`);
                console.log(`   Hash:  ${match.infoHash}`);
            } else {
                console.log(`❌ NO MATCH for ${show.name}`);
                // Print top 5 titles to debug
                // streams.slice(0, 5).forEach(s => console.log(`   - ${s.title.split('\n')[0]}`));
            }
            
        } catch (e) {
            console.error(`Error processing ${show.name}:`, e.message);
        }
        console.log("---");
    }
}

main();
