const WebSocket = require('ws');
const { performance } = require('perf_hooks');

const TEST_CONFIG = {
  serverUrl: 'ws://localhost:18081/ws',
  concurrentUsers: 5,
  roomId: 'test-room-simple',
  messagesPerUser: 5,
  messageInterval: 100, // ms between messages
  testDuration: 5000 // ms
};

class SimpleTestClient {
  constructor(userId, roomId) {
    this.userId = userId;
    this.roomId = roomId;
    this.ws = null;
    this.connected = false;
    this.messagesReceived = 0;
    this.messagesSent = 0;
    this.latencies = [];
    this.connectionTime = null;
  }

  async connect() {
    return new Promise((resolve, reject) => {
      const startTime = performance.now();

      this.ws = new WebSocket(TEST_CONFIG.serverUrl);

      this.ws.on('open', () => {
        this.connectionTime = performance.now() - startTime;
        this.connected = true;

        // Send auth message
        this.ws.send(JSON.stringify({
          type: 'auth',
          token: 'test-token',
          roomId: this.roomId,
          role: 'guest'
        }));

        resolve();
      });

      this.ws.on('message', (data) => {
        const message = JSON.parse(data.toString());
        console.log(`Client ${this.userId} received:`, message.type);

        if (message.type === 'auth_ok') {
          this.messagesReceived++;
        } else if (message.type === 'state') {
          this.messagesReceived++;
          if (message.timestamp) {
            const latency = performance.now() - message.timestamp;
            this.latencies.push(latency);
          }
        }
      });

      this.ws.on('error', (error) => {
        console.error(`Client ${this.userId} error:`, error.message);
        reject(error);
      });

      this.ws.on('close', () => {
        this.connected = false;
      });
    });
  }

  sendMessages() {
    const interval = setInterval(() => {
      if (!this.connected || this.messagesSent >= TEST_CONFIG.messagesPerUser) {
        clearInterval(interval);
        return;
      }

      const message = {
        type: 'heartbeat',
        timestamp: performance.now(),
        positionMs: Math.floor(Math.random() * 3600000),
        playing: Math.random() > 0.5
      };

      this.ws.send(JSON.stringify(message));
      this.messagesSent++;
    }, TEST_CONFIG.messageInterval);
  }

  disconnect() {
    if (this.ws && this.connected) {
      this.ws.close();
    }
  }

  getStats() {
    return {
      userId: this.userId,
      connected: this.connected,
      connectionTime: this.connectionTime,
      messagesSent: this.messagesSent,
      messagesReceived: this.messagesReceived,
      avgLatency: this.latencies.length > 0
        ? this.latencies.reduce((a, b) => a + b, 0) / this.latencies.length
        : 0,
      maxLatency: this.latencies.length > 0 ? Math.max(...this.latencies) : 0,
      minLatency: this.latencies.length > 0 ? Math.min(...this.latencies) : 0
    };
  }
}

async function runSimpleTest() {
  console.log(`🚀 Starting simple test with ${TEST_CONFIG.concurrentUsers} concurrent users`);
  console.log(`📊 Room: ${TEST_CONFIG.roomId}`);
  console.log(`⏱️  Test duration: ${TEST_CONFIG.testDuration}ms`);
  console.log('');

  // Create test clients
  const clients = [];
  for (let i = 0; i < TEST_CONFIG.concurrentUsers; i++) {
    clients.push(new SimpleTestClient(`test-user-${i}`, TEST_CONFIG.roomId));
  }

  // Connect all clients
  console.log('🔗 Connecting clients...');
  const connectStartTime = performance.now();

  await Promise.all(clients.map(client => client.connect()));

  const connectEndTime = performance.now();
  const totalConnectTime = connectEndTime - connectStartTime;

  console.log(`✅ All clients connected in ${totalConnectTime.toFixed(2)}ms`);
  console.log(`📈 Average connection time per client: ${(totalConnectTime / TEST_CONFIG.concurrentUsers).toFixed(2)}ms`);
  console.log('');

  // Start sending messages
  console.log('📤 Starting message exchange...');
  clients.forEach(client => client.sendMessages());

  // Wait for test duration
  await new Promise(resolve => setTimeout(resolve, TEST_CONFIG.testDuration));

  // Collect stats
  console.log('📊 Collecting performance metrics...');
  const stats = clients.map(client => client.getStats());

  // Calculate aggregate stats
  const totalMessagesSent = stats.reduce((sum, s) => sum + s.messagesSent, 0);
  const totalMessagesReceived = stats.reduce((sum, s) => sum + s.messagesReceived, 0);
  const allLatencies = stats.flatMap(s => s.latencies);
  const avgLatency = allLatencies.length > 0
    ? allLatencies.reduce((a, b) => a + b, 0) / allLatencies.length
    : 0;
  const maxLatency = allLatencies.length > 0 ? Math.max(...allLatencies) : 0;
  const minLatency = allLatencies.length > 0 ? Math.min(...allLatencies) : 0;

  // Display results
  console.log('');
  console.log('📈 SIMPLE TEST RESULTS:');
  console.log('='.repeat(50));
  console.log(`👥 Concurrent Users: ${TEST_CONFIG.concurrentUsers}`);
  console.log(`📤 Messages Sent: ${totalMessagesSent}`);
  console.log(`📥 Messages Received: ${totalMessagesReceived}`);
  console.log(`📊 Successful Auths: ${stats.filter(s => s.messagesReceived > 0).length}`);
  console.log('');
  console.log('⏱️  LATENCY STATS:');
  console.log(`📊 Average Latency: ${avgLatency.toFixed(2)}ms`);
  console.log(`⬆️  Maximum Latency: ${maxLatency.toFixed(2)}ms`);
  console.log(`⬇️  Minimum Latency: ${minLatency.toFixed(2)}ms`);
  console.log('');
  console.log('🔗 CONNECTION STATS:');
  console.log(`📊 Average Connection Time: ${(totalConnectTime / TEST_CONFIG.concurrentUsers).toFixed(2)}ms`);
  console.log(`✅ Successful Connections: ${stats.filter(s => s.connected).length}`);

  // Cleanup
  console.log('');
  console.log('🧹 Cleaning up connections...');
  clients.forEach(client => client.disconnect());

  console.log('\n🎯 UWEBSOCKETS SERVER IS RUNNING AND RESPONDING!');
  console.log(`📊 Connection performance: ${(totalConnectTime / TEST_CONFIG.concurrentUsers).toFixed(2)}ms avg`);
}

// Check if server is running
function checkServer() {
  return new Promise((resolve) => {
    const ws = new WebSocket(TEST_CONFIG.serverUrl);
    ws.on('open', () => {
      ws.close();
      resolve(true);
    });
    ws.on('error', () => {
      resolve(false);
    });
  });
}

async function main() {
  console.log('🔍 Checking if server is running...');
  const serverRunning = await checkServer();

  if (!serverRunning) {
    console.error('❌ Server is not running on', TEST_CONFIG.serverUrl);
    console.error('💡 Start the server first: npm run dev');
    process.exit(1);
  }

  await runSimpleTest();
}

// Run if this file is executed directly
if (require.main === module) {
  main().catch(console.error);
}
