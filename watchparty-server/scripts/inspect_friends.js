const https = require('https');

const TOKEN = process.argv[2];
const HASH = "d403901f63f3d2d50d26856eb108ddcb7698f5d2";
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
        if (method === 'POST') options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

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

async function main() {
    try {
        // Add magnet
        const magnet = `magnet:?xt=urn:btih:${HASH}`;
        const addResult = await apiRequest('POST', '/torrents/addMagnet', `magnet=${encodeURIComponent(magnet)}`);
        const torrentId = addResult.id;
        console.log(`Torrent ID: ${torrentId}`);

        // Get info
        let info = await apiRequest('GET', `/torrents/info/${torrentId}`);
        console.log("Files:", JSON.stringify(info.files, null, 2));
        console.log("Links:", JSON.stringify(info.links, null, 2));

    } catch (e) {
        console.error(e);
    }
}

main();
