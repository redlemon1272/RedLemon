// Performance testing script for WebSocket server
// Simulates multiple concurrent users to test performance

import WebSocket from 'ws';
import { performance } from 'perf_hooks';

const TEST_CONFIG = {
  serverUrl: 'ws://localhost:8080/ws',
  concurrentUsers: 30,
  roomId: 'test-room-' + Math.random().toString(36).slice(2),
  messagesPerUser: 10,
  messageInterval: 100, // ms between messages
  testDuration: 10000 // ms
};

class TestClient {
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
        if (message.type !== 'auth_ok') {
          this.messagesReceived++;

          // Calculate latency for state messages
          if (message.type === 'state' && message.timestamp) {
            const latency = performance.now() - message.timestamp;
            this.latencies.push(latency);
          }
        }
      });

      this.ws.on('error', reject);
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
        type: ['play', 'pause', 'seek', 'heartbeat'][Math.floor(Math.random() * 4)],
        timestamp: performance.now(),
        positionMs: Math.floor(Math.random() * 3600000), // Random position up to 1 hour
        playing: Math.random() > 0.5
      };

      if (message.type === 'seek') {
        message.positionMs = Math.floor(Math.random() * 3600000);
      }

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

async function runPerformanceTest() {
  console.log(`🚀 Starting performance test with ${TEST_CONFIG.concurrentUsers} concurrent users`);
  console.log(`📊 Room: ${TEST_CONFIG.roomId}`);
  console.log(`⏱️  Test duration: ${TEST_CONFIG.testDuration}ms`);
  console.log('');

  // Create test clients
  const clients = [];
  for (let i = 0; i < TEST_CONFIG.concurrentUsers; i++) {
    clients.push(new TestClient(`test-user-${i}`, TEST_CONFIG.roomId));
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
  console.log('📈 PERFORMANCE RESULTS:');
  console.log('='.repeat(50));
  console.log(`👥 Concurrent Users: ${TEST_CONFIG.concurrentUsers}`);
  console.log(`📤 Messages Sent: ${totalMessagesSent}`);
  console.log(`📥 Messages Received: ${totalMessagesReceived}`);
  console.log(`📊 Message Delivery Rate: ${((totalMessagesReceived / totalMessagesSent) * 100).toFixed(2)}%`);
  console.log('');
  console.log('⏱️  LATENCY STATS:');
  console.log(`📊 Average Latency: ${avgLatency.toFixed(2)}ms`);
  console.log(`⬆️  Maximum Latency: ${maxLatency.toFixed(2)}ms`);
  console.log(`⬇️  Minimum Latency: ${minLatency.toFixed(2)}ms`);
  console.log('');
  console.log('🔗 CONNECTION STATS:');
  console.log(`📊 Average Connection Time: ${(totalConnectTime / TEST_CONFIG.concurrentUsers).toFixed(2)}ms`);
  console.log(`✅ Successful Connections: ${stats.filter(s => s.connected).length}`);
  console.log(`❌ Failed Connections: ${stats.filter(s => !s.connected).length}`);

  // Performance targets
  console.log('');
  console.log('🎯 PERFORMANCE TARGETS:');
  console.log('='.repeat(50));
  console.log(`⏱️  Target Latency: <5ms (Current: ${avgLatency.toFixed(2)}ms) ${avgLatency < 5 ? '✅' : '❌'}`);
  console.log(`👥 Target Users: 30+ (Current: ${TEST_CONFIG.concurrentUsers}) ${TEST_CONFIG.concurrentUsers >= 30 ? '✅' : '❌'}`);
  console.log(`📊 Target Delivery Rate: >95% (Current: ${((totalMessagesReceived / totalMessagesSent) * 100).toFixed(2)}%) ${((totalMessagesReceived / totalMessagesSent) * 100) > 95 ? '✅' : '❌'}`);

  // Cleanup
  console.log('');
  console.log('🧹 Cleaning up connections...');
  clients.forEach(client => client.disconnect());

  process.exit(avgLatency < 5 && ((totalMessagesReceived / totalMessagesSent) * 100) > 95 ? 0 : 1);
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

  await runPerformanceTest();
}

// Run if this file is executed directly
if (import.meta.url === `file://${process.argv[1]}`) {
  main().catch(console.error);
}

export { runPerformanceTest, TestClient };
