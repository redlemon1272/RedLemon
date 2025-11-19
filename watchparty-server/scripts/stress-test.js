// Comprehensive stress testing for WebSocket server
// Tests progressive user counts to find theoretical limits

import WebSocket from 'ws';
import { performance } from 'perf_hooks';
import { cpus, totalmem, freemem } from 'os';

const STRESS_CONFIG = {
  serverUrl: 'ws://localhost:8080/ws',
  testPhases: [50, 100, 200, 500, 1000], // Progressive user counts
  messageIntervals: [1000, 500, 200, 100], // Different message frequencies (ms)
  testDuration: 30000, // 30 seconds per test
  warmupTime: 5000, // 5 seconds warmup
  cooldownTime: 10000, // 10 seconds cooldown between tests
  connectionTimeout: 10000, // 10 seconds connection timeout
};

class StressTestClient {
  constructor(userId, roomId, messageInterval) {
    this.userId = userId;
    this.roomId = roomId;
    this.messageInterval = messageInterval;
    this.ws = null;
    this.connected = false;
    this.messagesReceived = 0;
    this.messagesSent = 0;
    this.connectionTime = null;
    this.latencies = [];
    this.lastActivityTime = Date.now();
    this.messageTimer = null;
    this.errors = 0;
  }

  async connect() {
    return new Promise((resolve, reject) => {
      const startTime = performance.now();
      const timeout = setTimeout(() => {
        reject(new Error('Connection timeout'));
      }, STRESS_CONFIG.connectionTimeout);

      this.ws = new WebSocket(STRESS_CONFIG.serverUrl);

      this.ws.on('open', () => {
        clearTimeout(timeout);
        this.connectionTime = performance.now() - startTime;
        this.connected = true;
        this.lastActivityTime = Date.now();

        // Send auth message
        this.ws.send(JSON.stringify({
          type: 'auth',
          token: 'stress-test-token',
          roomId: this.roomId,
          role: 'guest'
        }));

        resolve();
      });

      this.ws.on('message', (data) => {
        this.messagesReceived++;
        this.lastActivityTime = Date.now();

        const message = JSON.parse(data.toString());
        if (message.type === 'state' && message.timestamp) {
          const latency = performance.now() - message.timestamp;
          this.latencies.push(latency);
        }
      });

      this.ws.on('error', (error) => {
        clearTimeout(timeout);
        this.errors++;
        reject(error);
      });

      this.ws.on('close', () => {
        clearTimeout(timeout);
        this.connected = false;
      });
    });
  }

  startMessaging() {
    if (!this.connected) return;

    this.messageTimer = setInterval(() => {
      if (!this.connected) {
        clearInterval(this.messageTimer);
        return;
      }

      const message = {
        type: ['play', 'pause', 'seek', 'heartbeat'][Math.floor(Math.random() * 4)],
        timestamp: performance.now(),
        positionMs: Math.floor(Math.random() * 3600000),
        playing: Math.random() > 0.5
      };

      try {
        this.ws.send(JSON.stringify(message));
        this.messagesSent++;
      } catch (error) {
        this.errors++;
      }
    }, this.messageInterval);
  }

  stopMessaging() {
    if (this.messageTimer) {
      clearInterval(this.messageTimer);
      this.messageTimer = null;
    }
  }

  disconnect() {
    this.stopMessaging();
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
      errors: this.errors,
      avgLatency: this.latencies.length > 0
        ? this.latencies.reduce((a, b) => a + b, 0) / this.latencies.length
        : 0,
      maxLatency: this.latencies.length > 0 ? Math.max(...this.latencies) : 0,
      minLatency: this.latencies.length > 0 ? Math.min(...this.latencies) : 0,
      lastActivity: this.lastActivityTime
    };
  }
}

class SystemMonitor {
  constructor() {
    this.startTime = Date.now();
    this.measurements = [];
    this.monitoringInterval = null;
  }

  start() {
    this.monitoringInterval = setInterval(() => {
      const memUsage = process.memoryUsage();
      const cpuUsage = process.cpuUsage();
      const systemMem = {
        total: totalmem(),
        free: freemem(),
        used: totalmem() - freemem()
      };

      this.measurements.push({
        timestamp: Date.now(),
        memory: {
          rss: memUsage.rss / 1024 / 1024, // MB
          heapUsed: memUsage.heapUsed / 1024 / 1024, // MB
          heapTotal: memUsage.heapTotal / 1024 / 1024, // MB
          system: systemMem
        },
        cpu: {
          user: cpuUsage.user,
          system: cpuUsage.system
        },
        uptime: process.uptime()
      });
    }, 1000); // Every second
  }

  stop() {
    if (this.monitoringInterval) {
      clearInterval(this.monitoringInterval);
      this.monitoringInterval = null;
    }
  }

  getStats() {
    if (this.measurements.length === 0) return null;

    const memoryPeak = Math.max(...this.measurements.map(m => m.memory.rss));
    const memoryAvg = this.measurements.reduce((sum, m) => sum + m.memory.rss, 0) / this.measurements.length;
    const systemMemUsage = this.measurements[this.measurements.length - 1]?.memory.system;

    return {
      duration: Date.now() - this.startTime,
      measurements: this.measurements.length,
      memory: {
        peak: memoryPeak,
        average: memoryAvg,
        system: systemMemUsage
      },
      cpu: this.measurements[this.measurements.length - 1]?.cpu,
      uptime: process.uptime()
    };
  }
}

async function runStressTest(userCount, messageInterval) {
  console.log(`\n🧪 Testing ${userCount} users with ${1000/messageInterval} msgs/sec per user`);
  console.log('='.repeat(60));

  const roomId = `stress-test-${userCount}-${Date.now()}`;
  const monitor = new SystemMonitor();
  monitor.start();

  // Create test clients
  const clients = [];
  for (let i = 0; i < userCount; i++) {
    clients.push(new StressTestClient(`stress-user-${i}`, roomId, messageInterval));
  }

  // Connect clients with batch processing to avoid overwhelming
  console.log(`🔗 Connecting ${userCount} clients...`);
  const connectStartTime = performance.now();

  const batchSize = 50; // Connect 50 clients at a time
  for (let i = 0; i < clients.length; i += batchSize) {
    const batch = clients.slice(i, i + batchSize);
    await Promise.allSettled(batch.map(client => client.connect()));

    // Small delay between batches
    if (i + batchSize < clients.length) {
      await new Promise(resolve => setTimeout(resolve, 100));
    }
  }

  const connectEndTime = performance.now();
  const successfulConnections = clients.filter(c => c.connected).length;
  const failedConnections = userCount - successfulConnections;

  console.log(`✅ Connections: ${successfulConnections}/${userCount} successful (${failedConnections} failed)`);
  console.log(`⏱️  Connection time: ${(connectEndTime - connectStartTime).toFixed(2)}ms`);
  console.log(`📊 Success rate: ${((successfulConnections / userCount) * 100).toFixed(2)}%`);

  if (successfulConnections === 0) {
    monitor.stop();
    return { success: false, userCount, messageInterval, error: 'All connections failed' };
  }

  // Warmup period
  console.log(`🔥 Warmup period (${STRESS_CONFIG.warmupTime/1000}s)...`);
  clients.forEach(client => client.startMessaging());
  await new Promise(resolve => setTimeout(resolve, STRESS_CONFIG.warmupTime));

  // Main test period
  console.log(`🚀 Starting stress test (${STRESS_CONFIG.testDuration/1000}s)...`);
  const testStartTime = Date.now();

  await new Promise(resolve => setTimeout(resolve, STRESS_CONFIG.testDuration));

  const testEndTime = Date.now();

  // Stop messaging and collect stats
  clients.forEach(client => client.stopMessaging());

  console.log(`📊 Collecting metrics...`);
  const stats = clients.map(client => client.getStats());
  const systemStats = monitor.getStats();

  // Calculate aggregate stats
  const totalMessagesSent = stats.reduce((sum, s) => sum + s.messagesSent, 0);
  const totalMessagesReceived = stats.reduce((sum, s) => sum + s.messagesReceived, 0);
  const totalErrors = stats.reduce((sum, s) => sum + s.errors, 0);
  const allLatencies = stats.flatMap(s => s.latencies);
  const avgLatency = allLatencies.length > 0
    ? allLatencies.reduce((a, b) => a + b, 0) / allLatencies.length
    : 0;
  const maxLatency = allLatencies.length > 0 ? Math.max(...allLatencies) : 0;
  const stillConnected = stats.filter(s => s.connected).length;

  // Display results
  console.log('\n📈 STRESS TEST RESULTS:');
  console.log('='.repeat(60));
  console.log(`👥 Users: ${userCount} (${1000/messageInterval} msgs/sec each)`);
  console.log(`🔗 Final Connections: ${stillConnected}/${userCount} (${((stillConnected/userCount)*100).toFixed(2)}%)`);
  console.log(`📤 Messages Sent: ${totalMessagesSent}`);
  console.log(`📥 Messages Received: ${totalMessagesReceived}`);
  console.log(`📊 Delivery Rate: ${totalMessagesSent > 0 ? ((totalMessagesReceived/totalMessagesSent)*100).toFixed(2) : 0}%`);
  console.log(`❌ Errors: ${totalErrors}`);
  console.log('');
  console.log('⏱️  LATENCY:');
  console.log(`📊 Average: ${avgLatency.toFixed(2)}ms`);
  console.log(`⬆️  Maximum: ${maxLatency.toFixed(2)}ms`);
  console.log(`⬇️  Minimum: ${allLatencies.length > 0 ? Math.min(...allLatencies).toFixed(2) : 'N/A'}ms`);
  console.log('');
  console.log('💾 SYSTEM RESOURCES:');
  if (systemStats) {
    console.log(`📊 Memory Peak: ${systemStats.memory.peak.toFixed(2)}MB`);
    console.log(`📊 Memory Avg: ${systemStats.memory.average.toFixed(2)}MB`);
    console.log(`🖥️  System Memory Used: ${systemStats.memory.system ? ((systemStats.memory.system.used/systemStats.memory.system.total)*100).toFixed(2) : 'N/A'}%`);
    console.log(`⚡ Uptime: ${systemStats.uptime.toFixed(2)}s`);
  }

  // Cleanup
  console.log(`🧹 Disconnecting clients...`);
  clients.forEach(client => client.disconnect());

  monitor.stop();

  // Determine test success
  const successThresholds = {
    connectionRate: 0.8, // 80% of connections must succeed
    deliveryRate: 0.5,  // 50% of messages must be delivered
    latencyThreshold: 1000, // Average latency under 1 second
    stabilityThreshold: 0.7 // 70% of connections must stay connected
  };

  const connectionSuccess = (successfulConnections / userCount) >= successThresholds.connectionRate;
  const deliverySuccess = totalMessagesSent > 0 && (totalMessagesReceived / totalMessagesSent) >= successThresholds.deliveryRate;
  const latencySuccess = avgLatency < successThresholds.latencyThreshold;
  const stabilitySuccess = (stillConnected / userCount) >= successThresholds.stabilityThreshold;

  const overallSuccess = connectionSuccess && deliverySuccess && latencySuccess && stabilitySuccess;

  return {
    success: overallSuccess,
    userCount,
    messageInterval,
    results: {
      connections: { successful: successfulConnections, total: userCount, rate: (successfulConnections/userCount)*100 },
      messages: { sent: totalMessagesSent, received: totalMessagesReceived, rate: totalMessagesSent > 0 ? (totalMessagesReceived/totalMessagesSent)*100 : 0 },
      errors: totalErrors,
      latency: { avg: avgLatency, max: maxLatency, min: allLatencies.length > 0 ? Math.min(...allLatencies) : 0 },
      stability: { stillConnected, rate: (stillConnected/userCount)*100 }
    },
    system: systemStats,
    thresholds: successThresholds
  };
}

async function runComprehensiveStressTest() {
  console.log('🚀 Starting Comprehensive WebSocket Stress Test');
  console.log(`📊 Server: ${STRESS_CONFIG.serverUrl}`);
  console.log(`🖥️  System: ${cpus().length} CPUs, ${(totalmem()/1024/1024/1024).toFixed(2)}GB RAM`);
  console.log(`⏱️  Test Duration: ${STRESS_CONFIG.testDuration/1000}s per phase`);
  console.log(`🔄 Message Intervals: ${STRESS_CONFIG.messageIntervals.join(', ')}ms`);

  const allResults = [];

  // Test each user count with each message interval
  for (const userCount of STRESS_CONFIG.testPhases) {
    for (const messageInterval of STRESS_CONFIG.messageIntervals) {
      const result = await runStressTest(userCount, messageInterval);
      allResults.push(result);

      // Cooldown between tests
      if (result === allResults[allResults.length - 1]) { // Not the last test
        console.log(`\n⏳ Cooldown: ${STRESS_CONFIG.cooldownTime/1000}s...`);
        await new Promise(resolve => setTimeout(resolve, STRESS_CONFIG.cooldownTime));
      }
    }
  }

  // Summary analysis
  console.log('\n' + '='.repeat(80));
  console.log('📊 COMPREHENSIVE STRESS TEST SUMMARY');
  console.log('='.repeat(80));

  const successfulTests = allResults.filter(r => r.success);
  const failedTests = allResults.filter(r => !r.success);

  console.log(`✅ Successful Tests: ${successfulTests.length}/${allResults.length}`);
  console.log(`❌ Failed Tests: ${failedTests.length}/${allResults.length}`);

  // Find breaking points
  const maxUsersSuccess = Math.max(...successfulTests.map(r => r.userCount));
  const minUsersFail = failedTests.length > 0 ? Math.min(...failedTests.map(r => r.userCount)) : null;

  console.log(`\n🎯 THEORETICAL LIMITS:`);
  console.log(`📊 Maximum Tested Success: ${maxUsersSuccess} users`);
  console.log(`❌ First Failure Point: ${minUsersFail || 'None within test range'} users`);

  if (minUsersFail) {
    const safeLimit = Math.floor(minUsersFail * 0.8); // 80% of failure point
    console.log(`🛡️  Recommended Production Limit: ${safeLimit} users per room`);
  }

  // Performance trends
  console.log(`\n📈 PERFORMANCE TRENDS:`);
  const latencyByUsers = {};
  const deliveryByUsers = {};

  allResults.forEach(result => {
    if (result.success) {
      const users = result.userCount;
      if (!latencyByUsers[users]) latencyByUsers[users] = [];
      if (!deliveryByUsers[users]) deliveryByUsers[users] = [];

      latencyByUsers[users].push(result.results.latency.avg);
      deliveryByUsers[users].push(result.results.messages.rate);
    }
  });

  Object.keys(latencyByUsers).sort((a, b) => Number(a) - Number(b)).forEach(users => {
    const avgLatency = latencyByUsers[users].reduce((a, b) => a + b, 0) / latencyByUsers[users].length;
    const avgDelivery = deliveryByUsers[users].reduce((a, b) => a + b, 0) / deliveryByUsers[users].length;
    console.log(`👥 ${users} users: ${avgLatency.toFixed(2)}ms avg latency, ${avgDelivery.toFixed(2)}% delivery`);
  });

  console.log('\n🏁 Stress testing complete!');
}

// Check if server is running
function checkServer() {
  return new Promise((resolve) => {
    const ws = new WebSocket(STRESS_CONFIG.serverUrl);
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
    console.error('❌ Server is not running on', STRESS_CONFIG.serverUrl);
    console.error('💡 Start the server first: npm run dev');
    process.exit(1);
  }

  await runComprehensiveStressTest();
}

if (import.meta.url === `file://${process.argv[1]}`) {
  main().catch(console.error);
}

export { runComprehensiveStressTest, StressTestClient, SystemMonitor };
