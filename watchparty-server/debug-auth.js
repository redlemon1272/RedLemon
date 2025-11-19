import WebSocket from 'ws';

// Set AUTH_BYPASS for testing
process.env.AUTH_BYPASS = 'true';

const TEST_CONFIG = {
  serverUrl: 'ws://localhost:18081/ws',
  roomId: 'debug-room-test'
};

class DebugClient {
  constructor(name) {
    this.name = name;
    this.ws = null;
    this.authReceived = false;
  }

  async connect() {
    return new Promise((resolve, reject) => {
      console.log(`[${this.name}] Connecting to server...`);

      this.ws = new WebSocket(TEST_CONFIG.serverUrl);

      this.ws.on('open', () => {
        console.log(`[${this.name}] WebSocket connected, sending auth...`);

        // Send auth message
        this.ws.send(JSON.stringify({
          type: 'auth',
          token: 'test-token',
          roomId: TEST_CONFIG.roomId,
          role: 'guest'
        }));
      });

      this.ws.on('message', (data) => {
        const message = JSON.parse(data.toString());
        console.log(`[${this.name}] Received:`, message);

        if (message.type === 'auth_ok') {
          console.log(`[${this.name}] ✅ Authentication successful!`);
          this.authReceived = true;
          resolve();
        } else if (message.type === 'error') {
          console.log(`[${this.name}] ❌ Authentication failed:`, message.message);
          reject(new Error(message.message));
        }
      });

      this.ws.on('error', (error) => {
        console.log(`[${this.name}] ❌ WebSocket error:`, error.message);
        reject(error);
      });

      this.ws.on('close', (code, reason) => {
        console.log(`[${this.name}] Connection closed:`, code, reason.toString());
      });

      // Timeout after 5 seconds
      setTimeout(() => {
        if (!this.authReceived) {
          reject(new Error('Authentication timeout'));
        }
      }, 5000);
    });
  }

  disconnect() {
    if (this.ws) {
      this.ws.close();
    }
  }
}

async function main() {
  console.log('🔍 Debug authentication with AUTH_BYPASS...');
  console.log('Server URL:', TEST_CONFIG.serverUrl);
  console.log('Room ID:', TEST_CONFIG.roomId);
  console.log('AUTH_BYPASS:', process.env.AUTH_BYPASS);
  console.log('');

  const client = new DebugClient('DebugClient');

  try {
    await client.connect();
    console.log('\n✅ Authentication bypass is working!');

    // Test sending a message
    console.log('\n📤 Testing message sending...');
    client.ws.send(JSON.stringify({
      type: 'heartbeat',
      positionMs: 12345,
      playing: true
    }));

    // Wait a bit to see if we get any response
    setTimeout(() => {
      console.log('\n🧹 Disconnecting...');
      client.disconnect();
      process.exit(0);
    }, 2000);

  } catch (error) {
    console.error('\n❌ Authentication failed:', error.message);
    client.disconnect();
    process.exit(1);
  }
}

main().catch(console.error);
