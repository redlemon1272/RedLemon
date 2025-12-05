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

        // 2. Get Info & Select Files
        console.log("Getting info...");
        let info = await apiRequest('GET', `/torrents/info/${torrentId}`);
        
        if (info.status === 'waiting_files_selection') {
            console.log("Selecting all files...");
            await apiRequest('POST', `/torrents/selectFiles/${torrentId}`, 'files=all');
        }

        // 3. Wait for conversion (if needed)
        // For cached torrents (which these should be), it's instant.
        // But we might need to poll.
        while (info.status !== 'downloaded') {
            console.log(`Status: ${info.status}. Waiting...`);
            await new Promise(r => setTimeout(r, 1000));
            info = await apiRequest('GET', `/torrents/info/${torrentId}`);
        }

        // 4. Process Links
        console.log(`Processing ${info.links.length} links...`);
        const runtimes = {};

        // We need to map files to links to get filenames
        // info.files has the structure, info.links has the links
        // RealDebrid maps them 1:1 if selected 'all' usually, but let's be careful.
        // Actually, unrestrict gives us the filename!

        for (const link of info.links) {
            try {
                const unrestrict = await apiRequest('POST', '/unrestrict/link', `link=${encodeURIComponent(link)}`);
                const downloadUrl = unrestrict.download;
                const filename = unrestrict.filename;
                
                console.log(`Probing: ${filename}`);
                const duration = await getDuration(downloadUrl);
                console.log(`   Duration: ${duration}s`);
                
                // Parse SxxExx
                const match = filename.match(/S(\d+)E(\d+)/i);
                if (match) {
                    const season = parseInt(match[1]);
                    const episode = parseInt(match[2]);
                    const key = `${season}-${episode}`;
                    runtimes[key] = parseFloat(duration);
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
