const https = require('https');
const fs = require('fs');

const TOKEN = process.argv[2];
const MAGNET_OR_HASH = process.argv[3];

if (!TOKEN || !MAGNET_OR_HASH) {
    console.error("Usage: node index_show.js <RD_TOKEN> <MAGNET_OR_HASH>");
    process.exit(1);
}

const BASE_URL = "https://api.real-debrid.com/rest/1.0";

function apiRequest(method, endpoint, body = null) {
    return new Promise((resolve, reject) => {
        const url = `${BASE_URL}${endpoint}`;
        const options = {
            method: method,
            headers: {
                'Authorization': `Bearer ${TOKEN}`
            }
        };

        if (body) {
            options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
        }

        const req = https.request(url, options, (res) => {
            let data = '';
            res.on('data', (chunk) => data += chunk);
            res.on('end', () => {
                if (res.statusCode >= 200 && res.statusCode < 300) {
                    try {
                        resolve(JSON.parse(data));
                    } catch (e) {
                        resolve(data); // Handle non-JSON response
                    }
                } else {
                    reject({ statusCode: res.statusCode, body: data });
                }
            });
        });

        req.on('error', (e) => reject(e));

        if (body) {
            req.write(body);
        }
        req.end();
    });
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function main() {
    try {
        console.log("1. Adding magnet/hash...");
        const addResult = await apiRequest('POST', '/torrents/addMagnet', `magnet=${encodeURIComponent(MAGNET_OR_HASH)}`);
        const torrentId = addResult.id;
        console.log(`   Torrent ID: ${torrentId}`);

        console.log("2. Getting torrent info...");
        let info = await apiRequest('GET', `/torrents/info/${torrentId}`);
        
        if (info.status === 'waiting_files_selection') {
            console.log("3. Selecting all files...");
            await apiRequest('POST', `/torrents/selectFiles/${torrentId}`, 'files=all');
        }

        // Wait for links to be generated
        while (info.status !== 'downloaded') {
            console.log(`   Status: ${info.status}. Waiting...`);
            await sleep(2000);
            info = await apiRequest('GET', `/torrents/info/${torrentId}`);
            if (info.status === 'error' || info.status === 'dead') {
                throw new Error(`Torrent status: ${info.status}`);
            }
        }

        console.log(`4. Processing ${info.links.length} links...`);
        
        const runtimes = {}; // "S01E01": 1234.5

        for (let i = 0; i < info.links.length; i++) {
            const link = info.links[i];
            try {
                // Unrestrict
                const unrestrict = await apiRequest('POST', '/unrestrict/link', `link=${encodeURIComponent(link)}`);
                
                // Get Media Info
                const mediaInfo = await apiRequest('GET', `/media/info/${unrestrict.id}`);
                
                if (mediaInfo && mediaInfo.duration) {
                    const filename = mediaInfo.filename || unrestrict.filename;
                    const duration = mediaInfo.duration;
                    
                    // Extract SxxExx
                    const match = filename.match(/S(\d{1,2})E(\d{1,2})/i);
                    if (match) {
                        const season = parseInt(match[1]);
                        const episode = parseInt(match[2]);
                        const key = `S${season.toString().padStart(2, '0')}E${episode.toString().padStart(2, '0')}`;
                        
                        runtimes[key] = duration;
                        console.log(`   ✅ ${key}: ${duration}s (${filename})`);
                    } else {
                        console.log(`   ⚠️ No SxxExx match: ${filename}`);
                    }
                } else {
                    console.log(`   ⚠️ No duration info for link ${i+1}`);
                }
                
                // Rate limit protection
                await sleep(500); 
                
            } catch (e) {
                console.error(`   ❌ Error processing link ${i+1}:`, e.message || e);
            }
        }

        console.log("5. Saving runtimes.json...");
        fs.writeFileSync('runtimes.json', JSON.stringify(runtimes, null, 2));
        console.log("Done!");

    } catch (e) {
        console.error("Error:", e);
    }
}

main();
