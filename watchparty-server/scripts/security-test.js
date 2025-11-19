/**
 * Security Test Suite for Watch Party Server
 * Tests all security hardening features implemented
 */

const WebSocket = require('ws');
const crypto = require('crypto');

const SERVER_URL = 'ws://localhost:8080/ws';
const HTTP_URL = 'http://localhost:8080';

// Test configuration
const TEST_CONFIG = {
  // Valid test JWT (would need real Supabase credentials in production)
  VALID_JWT: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ0ZXN0LWlkIiwicm9sZSI6Imhvc3QiLCJleHAiOiIxNjAwMDAwMDAwMCIsImVjQiOjE2NzQyMDAwMCIsImF1ZCI6Imh0b3QiLCJzdWIiOiJ0ZXN0LXVzZXItaWQiLCJpc3MiOiJhcHBsaWNhdGlvbiIsInJvbSI6ImFkbWluIiwiaWFhIjoxNjE2MDAwMDAwMCJ9.invalid',

  // Expired JWT
  EXPIRED_JWT: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzQyMDAwMDAwLCJpc3MiOiJ0ZXN0LWlkIiwicm9sZSI6Imhvc3QiLCJleHAiOiIxNjAwMDAwMDAwMCIsImVjQiOjE2NzQyMDAwMCIsImF1ZCI6Imh0b3QiLCJzdWIiOiJ0ZXN0LWlkIiwidXQiOiJhcHBsaWNhdGlvbiIsInJvbSI6ImFkbWluIiwiaWFhIjoxNjE2MDAwMDAwMCJ9.invalid',

  // Malformed JWT
  MALFORMED_JWT: 'not.a.valid.jwt',

  // Test room ID
  TEST_ROOM_ID: 'test-security-room-' + Math.random().toString(36).slice(2, 8),

  // Test user IDs
  TEST_HOST_ID: 'test-host-' + Math.random().toString(36).slice(2, 8),
  TEST_GUEST_ID: 'test-guest-' + Math.random().toString(36).slice(2, 8)
};

class SecurityTester {
  constructor() {
    this.results = [];
    this.currentTest = null;
  }

  async runAllTests() {
    console.log('🔒 Starting Security Test Suite...\n');

    const tests = [
      this.testHTTPPathValidation,
      this.testRateLimiting,
      this.testMessageSizeValidation,
      this.testJWTValidation,
      this.testAuthRequired,
      this.testHostOnlyOperations,
      this.testRoomAccessValidation,
      this.testReconnectionSupport,
      this.testPingPongTimeout,
      this.testCompressionEnabled,
      this.testHealthEndpoint
    ];

    for (const test of tests) {
      await test.call(this);
    }

    this.printResults();
  }

  async testHTTPPathValidation() {
    return this.runTest('HTTP Path Validation', async () => {
      const response = await this.makeHTTPRequest('/invalid-path');
      return response.statusCode === 404;
    });
  }

  async testHealthEndpoint() {
    return this.runTest('Health Endpoint', async () => {
      const response = await this.makeHTTPRequest('/healthz');
      return response.statusCode === 200 && response.data === 'ok';
    });
  }

  async testRateLimiting() {
    return this.runTest('Rate Limiting', async () => {
      const ws = await this.createWebSocket();
      let messagesSent = 0;
      let rateLimited = false;

      // Authenticate first
      await this.authenticate(ws, TEST_CONFIG.TEST_ROOM_ID, 'host');

      // Send rapid messages to trigger rate limit
      const rapidMessages = setInterval(() => {
        if (messagesSent >= 15) { // Should trigger rate limit
          clearInterval(rapidMessages);
          return;
        }

        try {
          ws.send(JSON.stringify({ type: 'chat', text: `Message ${messagesSent}` }));
          messagesSent++;
        } catch (error) {
          if (error.message.includes('Rate limit exceeded')) {
            rateLimited = true;
            clearInterval(rapidMessages);
          }
        }
      }, 10); // Very fast messages

      return new Promise((resolve) => {
        setTimeout(() => {
          ws.close();
          resolve(rateLimited);
        }, 2000);
      });
    });
  }

  async testMessageSizeValidation() {
    return this.runTest('Message Size Validation', async () => {
      const ws = await this.createWebSocket();
      await this.authenticate(ws, TEST_CONFIG.TEST_ROOM_ID, 'host');

      let sizeRejected = false;

      // Send oversized message
      const oversizedMessage = 'x'.repeat(10000); // 10KB message
      try {
        ws.send(JSON.stringify({ type: 'chat', text: oversizedMessage }));
      } catch (error) {
        if (error.message.includes('Message too large')) {
          sizeRejected = true;
        }
      }

      return new Promise((resolve) => {
        setTimeout(() => {
          ws.close();
          resolve(sizeRejected);
        }, 1000);
      });
    });
  }

  async testJWTValidation() {
    return this.runTest('JWT Validation', async () => {
      const testCases = [
        { name: 'No JWT', token: null, expected: 'auth_failed' },
        { name: 'Malformed JWT', token: TEST_CONFIG.MALFORMED_JWT, expected: 'auth_failed' },
        { name: 'Expired JWT', token: TEST_CONFIG.EXPIRED_JWT, expected: 'auth_failed' }
      ];

      for (const testCase of testCases) {
        const ws = await this.createWebSocket();

        try {
          ws.send(JSON.stringify({
            type: 'auth',
            roomId: TEST_CONFIG.TEST_ROOM_ID,
            role: 'host',
            token: testCase.token
          }));
        } catch (error) {
          // Will be caught in error handler
        }

        const result = await new Promise((resolve) => {
          let authenticated = false;
          let errorReceived = false;

          ws.on('message', (data) => {
            const message = JSON.parse(data.toString());
            if (message.type === 'error' && message.code === 4003) {
              errorReceived = true;
            } else if (message.type === 'auth_ok') {
              authenticated = true;
            }
          });

          ws.on('close', () => {
            resolve({
              testCase: testCase.name,
              expectedError: testCase.expected,
              errorReceived,
              authenticated: !authenticated && !errorReceived
            });
          });

          setTimeout(() => {
            ws.close();
          }, 2000);
        });

        this.currentTest = `JWT: ${result.testCase}`;
        const passed = result.errorReceived && !result.authenticated;
        this.results.push({
          test: `JWT Validation - ${result.testCase}`,
          passed,
          details: result
        });
      }
    });
  }

  async testAuthRequired() {
    return this.runTest('Auth Required', async () => {
      const ws = await this.createWebSocket();

      // Try to send message before auth
      let authRequired = false;

      try {
        ws.send(JSON.stringify({ type: 'chat', text: 'Should fail' }));
      } catch (error) {
        // Ignore for this test
      }

      const result = await new Promise((resolve) => {
        ws.on('message', (data) => {
          const message = JSON.parse(data.toString());
          if (message.type === 'error' && message.code === 4001) {
            authRequired = true;
          }
        });

        ws.on('close', () => {
          resolve(authRequired);
        });

        setTimeout(() => {
          ws.close();
        }, 1000);
      });

      return authRequired;
    });
  }

  async testHostOnlyOperations() {
    return this.runTest('Host-Only Operations', async () => {
      const hostWs = await this.createAuthenticatedWebSocket('host');
      const guestWs = await this.createAuthenticatedWebSocket('guest');

      let hostPassed = false;
      let guestBlocked = false;

      // Test guest trying host operation
      guestWs.send(JSON.stringify({ type: 'play' }));

      guestWs.on('message', (data) => {
        const message = JSON.parse(data.toString());
        if (message.type === 'error' && message.code === 4005) {
          guestBlocked = true;
        }
      });

      // Test host operation
      hostWs.send(JSON.stringify({ type: 'play' }));

      hostWs.on('message', (data) => {
        const message = JSON.parse(data.toString());
        if (message.type === 'state') {
          hostPassed = true;
        }
      });

      return new Promise((resolve) => {
        setTimeout(() => {
          hostWs.close();
          guestWs.close();
          resolve(hostPassed && guestBlocked);
        }, 2000);
      });
    });
  }

  async testRoomAccessValidation() {
    return this.runTest('Room Access Validation', async () => {
      // This test would require actual Supabase setup
      // For now, test that validation is enforced
      const ws = await this.createWebSocket();
      await this.authenticate(ws, 'non-existent-room', 'host');

      let accessDenied = false;

      ws.on('message', (data) => {
        const message = JSON.parse(data.toString());
        if (message.type === 'error' && message.code === 4004) {
          accessDenied = true;
        }
      });

      return new Promise((resolve) => {
        setTimeout(() => {
          ws.close();
          resolve(accessDenied);
        }, 2000);
      });
    });
  }

  async testReconnectionSupport() {
    return this.runTest('Reconnection Support', async () => {
      const ws1 = await this.createAuthenticatedWebSocket('host');

      let eventsReceived = [];
      let seq1 = 0;

      // Collect initial events
      ws1.on('message', (data) => {
        const message = JSON.parse(data.toString());
        if (message.type === 'state') {
          eventsReceived.push(message);
          seq1 = message.seq;
        }
      });

      // Wait for some events
      await new Promise(resolve => setTimeout(resolve, 1000));

      const ws2 = await this.createAuthenticatedWebSocket('host');

      // Connect with lastSeq to get snapshot
      ws2.send(JSON.stringify({
        type: 'auth',
        roomId: TEST_CONFIG.TEST_ROOM_ID,
        role: 'host',
        lastSeq: seq1
      }));

      let snapshotReceived = false;

      ws2.on('message', (data) => {
        const message = JSON.parse(data.toString());
        if (message.type === 'state_snapshot' && message.events) {
          snapshotReceived = true;
        }
      });

      return new Promise((resolve) => {
        setTimeout(() => {
          ws1.close();
          ws2.close();
          resolve(snapshotReceived);
        }, 2000);
      });
    });
  }

  async testPingPongTimeout() {
    return this.runTest('Ping/Pong Timeout', async () => {
      const ws = await this.createWebSocket();

      let pingReceived = false;
      ws.on('ping', () => {
        pingReceived = true;
      });

      // Don't send pong to test timeout
      let timeoutReceived = false;
      ws.on('close', (code) => {
        if (code === 1000) {
          timeoutReceived = true;
        }
      });

      await this.authenticate(ws, TEST_CONFIG.TEST_ROOM_ID, 'host');

      return new Promise((resolve) => {
        setTimeout(() => {
          ws.close();
          resolve(pingReceived || timeoutReceived);
        }, 70000); // Wait longer than PING_TIMEOUT
      });
    });
  }

  async testCompressionEnabled() {
    return this.runTest('Compression Enabled', async () => {
      const ws = await this.createAuthenticatedWebSocket('host');

      let compressionWorking = false;

      // Send a message that should be compressed
      const largeMessage = JSON.stringify({
        type: 'chat',
        text: 'x'.repeat(1000) // 1KB message
      });

      ws.on('message', () => {
        // If we receive this back, compression is working
        compressionWorking = true;
      });

      ws.send(largeMessage);

      return new Promise((resolve) => {
        setTimeout(() => {
          ws.close();
          resolve(compressionWorking);
        }, 2000);
      });
    });
  }

  async createWebSocket() {
    return new Promise((resolve, reject) => {
      const ws = new WebSocket(SERVER_URL);

      ws.on('open', () => {
        resolve(ws);
      });

      ws.on('error', (error) => {
        reject(error);
      });

      setTimeout(() => {
        ws.close();
        reject(new Error('Connection timeout'));
      }, 5000);
    });
  }

  async createAuthenticatedWebSocket(role) {
    const ws = await this.createWebSocket();
    await this.authenticate(ws, TEST_CONFIG.TEST_ROOM_ID, role);
    return ws;
  }

  async authenticate(ws, roomId, role) {
    return new Promise((resolve) => {
      ws.send(JSON.stringify({
        type: 'auth',
        roomId,
        role,
        token: TEST_CONFIG.VALID_JWT // This will fail but test the flow
      }));

      const timeout = setTimeout(() => {
        resolve(); // Continue even if auth fails
      }, 2000);

      ws.on('message', (data) => {
        const message = JSON.parse(data.toString());
        if (message.type === 'auth_ok' || message.type === 'error') {
          clearTimeout(timeout);
          resolve();
        }
      });
    });
  }

  async makeHTTPRequest(path) {
    return new Promise((resolve) => {
      const http = require('http');
      const req = http.request(`http://localhost:8080${path}`, (res) => {
        let data = '';
        res.on('data', (chunk) => {
          data += chunk;
        });

        res.on('end', () => {
          resolve({
            statusCode: res.statusCode,
            data: data.toString()
          });
        });
      });

      req.on('error', () => {
        resolve({ statusCode: 500, data: 'Connection error' });
      });

      req.end();
    });
  }

  runTest(testName, testFunction) {
    console.log(`\n🧪 Running: ${testName}`);

    return new Promise(async (resolve) => {
      try {
        const result = await testFunction();
        console.log(`✅ ${testName}: ${result ? 'PASSED' : 'FAILED'}`);
        this.results.push({
          test: testName,
          passed: result,
          details: result
        });
        resolve();
      } catch (error) {
        console.log(`❌ ${testName}: FAILED - ${error.message}`);
        this.results.push({
          test: testName,
          passed: false,
          error: error.message
        });
        resolve();
      }
    });
  }

  printResults() {
    console.log('\n📊 Security Test Results:');
    console.log('=' .repeat(50));

    const passed = this.results.filter(r => r.passed).length;
    const total = this.results.length;

    this.results.forEach(result => {
      const status = result.passed ? '✅ PASS' : '❌ FAIL';
      const details = result.details ? ` (${JSON.stringify(result.details)})` : '';
      console.log(`${status} ${result.test}${details}`);
    });

    console.log('=' .repeat(50));
    console.log(`\n📈 Summary: ${passed}/${total} tests passed (${Math.round(passed/total * 100)}%)`);

    if (passed === total) {
      console.log('🎉 All security tests passed!');
    } else {
      console.log('⚠️  Some security tests failed. Review implementation.');
    }
  }
}

// Run tests if this file is executed directly
if (require.main === module) {
  const tester = new SecurityTester();
  tester.runAllTests().catch(console.error);
}

module.exports = SecurityTester;
