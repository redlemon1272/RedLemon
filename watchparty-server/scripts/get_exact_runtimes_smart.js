const https = require('https');
const ffmpeg = require('fluent-ffmpeg');
const ffprobePath = require('ffprobe-static').path;

ffmpeg.setFfprobePath(ffprobePath);

const TOKEN = process.argv[2];
const HASH = process.argv[3];
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

        if (method === 'POST') {
            options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
        }

        const req = https.request(url, options, (res) => {
            let data = '';
            res.on('data', (chunk) => data += chunk);
            res.on('end', () => {
                try {
                    resolve(JSON.parse(data));
                } catch (e) {
                    resolve(data);
                }
            });
        });
        req.on('error', (e) => reject(e));
        if (body) req.write(body);
        req.end();
    });
}

function getDuration(url) {
    return new Promise((resolve, reject) => {
        ffmpeg.ffprobe(url, (err, metadata) => {
            if (err) return reject(err);
            resolve(metadata.format.duration);
        });
    });
}

function isVideoFile(filename) {
    const ext = filename.split('.').pop().toLowerCase();
    return ['mkv', 'mp4', 'avi', 'mov', 'wmv'].includes(ext);
}

async function main() {
    try {
        console.log(`Processing hash: ${HASH}`);

        // 1. Add Magnet
        const magnet = `magnet:?xt=urn:btih:${HASH}`;
        console.log("Adding magnet...");
        const addResult = await apiRequest('POST', '/torrents/addMagnet', `magnet=${encodeURIComponent(magnet)}`);
        if (!addResult.id) throw new Error("Failed to add magnet");
        const torrentId = addResult.id;
        console.log(`Torrent ID: ${torrentId}`);

        // 2. Get Info
        console.log("Getting info...");
        let info = await apiRequest('GET', `/torrents/info/${torrentId}`);
        
        if (info.status === 'waiting_files_selection') {
            // Filter for video files
            const videoFiles = info.files.filter(f => isVideoFile(f.path));
            const fileIds = videoFiles.map(f => f.id).join(',');
            
            console.log(`Selecting ${videoFiles.length} video files...`);
            await apiRequest('POST', `/torrents/selectFiles/${torrentId}`, `files=${fileIds}`);
        }

        // 3. Wait for conversion
        while (info.status !== 'downloaded') {
            console.log(`Status: ${info.status}. Waiting...`);
            await new Promise(r => setTimeout(r, 1000));
            info = await apiRequest('GET', `/torrents/info/${torrentId}`);
        }

        // 4. Process Links
        console.log(`Processing ${info.links.length} links...`);
        const runtimes = {};

        for (const link of info.links) {
            try {
                const unrestrict = await apiRequest('POST', '/unrestrict/link', `link=${encodeURIComponent(link)}`);
                const downloadUrl = unrestrict.download;
                const filename = unrestrict.filename;
                
                if (!isVideoFile(filename)) {
                    console.log(`Skipping non-video: ${filename}`);
                    continue;
                }

                console.log(`Probing: ${filename}`);
                const duration = await getDuration(downloadUrl);
                console.log(`   Duration: ${duration}s`);
                
                // Parse SxxExx
                // Friends format might be different?
                // "Friends Season 1 Episode 01 - The One Where Monica Gets A Roommate.mkv"
                // Or "Friends.S01E01.mkv"
                
                let match = filename.match(/S(\d+)E(\d+)/i);
                if (!match) {
                     // Try "Season X Episode Y"
                     match = filename.match(/Season\s*(\d+).*?Episode\s*(\d+)/i);
                }
                if (!match) {
                    // Try "1x01"
                    match = filename.match(/(\d+)x(\d+)/i);
                }
                
                if (match) {
                    const season = parseInt(match[1]);
                    const episode = parseInt(match[2]);
                    const key = `${season}-${episode}`;
                    runtimes[key] = parseFloat(duration);
                } else {
                    console.log(`   ⚠️ Could not parse S/E from: ${filename}`);
                }
            } catch (e) {
                console.error(`   Error: ${e.message}`);
            }
        }

        console.log(JSON.stringify(runtimes, null, 2));

    } catch (e) {
        console.error(e);
    }
}

main();
