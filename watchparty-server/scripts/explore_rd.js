const https = require('https');

const TOKEN = process.argv[2];
const BASE_URL = "https://api.real-debrid.com/rest/1.0";

function apiRequest(method, endpoint) {
    return new Promise((resolve, reject) => {
        const url = `${BASE_URL}${endpoint}`;
        console.log(`Requesting ${method} ${url}...`);
        const options = {
            method: method,
            headers: {
                'Authorization': `Bearer ${TOKEN}`
            }
        };

        const req = https.request(url, options, (res) => {
            let data = '';
            res.on('data', (chunk) => data += chunk);
            res.on('end', () => {
                console.log(`Status: ${res.statusCode}`);
                try {
                    resolve(JSON.parse(data));
                } catch (e) {
                    resolve(data);
                }
            });
        });
        req.on('error', (e) => reject(e));
        req.end();
    });
}

async function main() {
    try {
        // 1. List Torrents
        console.log("--- Listing Torrents ---");
        const torrents = await apiRequest('GET', '/torrents?limit=5');
        console.log("Torrents:", JSON.stringify(torrents, null, 2));

        if (torrents.length > 0) {
            const torrentId = torrents[0].id;
            console.log(`\n--- Inspecting Torrent ${torrentId} ---`);
            const info = await apiRequest('GET', `/torrents/info/${torrentId}`);
            console.log("Info:", JSON.stringify(info, null, 2));

            if (info.links && info.links.length > 0) {
                const link = info.links[0];
                console.log(`\n--- Unrestricting Link ${link} ---`);
                
                // Need POST for unrestrict
                // Implementing simple POST helper inline
                const unrestrict = await new Promise((resolve, reject) => {
                    const url = `${BASE_URL}/unrestrict/link`;
                    const options = {
                        method: 'POST',
                        headers: {
                            'Authorization': `Bearer ${TOKEN}`,
                            'Content-Type': 'application/x-www-form-urlencoded'
                        }
                    };
                    const req = https.request(url, options, (res) => {
                        let data = '';
                        res.on('data', (chunk) => data += chunk);
                        res.on('end', () => resolve(JSON.parse(data)));
                    });
                    req.write(`link=${encodeURIComponent(link)}`);
                    req.end();
                });
                
                console.log("Unrestrict:", JSON.stringify(unrestrict, null, 2));
                const id = unrestrict.id;
                
                console.log(`\n--- Testing Duration Endpoints for ID ${id} ---`);
                
                // Test 1: /media/info/{id}
                const test1 = await apiRequest('GET', `/media/info/${id}`);
                console.log("/media/info Result:", JSON.stringify(test1, null, 2));
                
                // Test 2: /streaming/mediaInfos/{id}
                const test2 = await apiRequest('GET', `/streaming/mediaInfos/${id}`);
                console.log("/streaming/mediaInfos Result:", JSON.stringify(test2, null, 2));
                
                 // Test 3: /streaming/transcode/{id}
                const test3 = await apiRequest('GET', `/streaming/transcode/${id}`);
                console.log("/streaming/transcode Result:", JSON.stringify(test3, null, 2));
            }
        }
    } catch (e) {
        console.error(e);
    }
}

main();
