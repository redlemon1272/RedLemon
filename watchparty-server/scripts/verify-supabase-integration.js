// Supabase Integration Verification Script
// Complete end-to-end testing of database operations

import { createClient } from '@supabase/supabase-js';
import { performance } from 'perf_hooks';
import WebSocket from 'ws';

const VERIFY_CONFIG = {
  serverUrl: 'ws://localhost:8080/ws',
  supabaseUrl: process.env.SUPABASE_URL || 'https://your-project.supabase.co',
  supabaseKey: process.env.SUPABASE_SERVICE_KEY || 'your-service-key',
  testRoomId: `verify-test-${Date.now()}`,
  testUserId: crypto.randomUUID(),
  testDuration: 10000, // 10 seconds
  connectionTimeout: 5000,
};

class SupabaseVerifier {
  constructor() {
    this.supabase = null;
    this.results = {
      database: { passed: 0, failed: 0, details: [] },
      websocket: { passed: 0, failed: 0, details: [] },
      integration: { passed: 0, failed: 0, details: [] },
    };
  }

  async initialize() {
    try {
      this.supabase = createClient(VERIFY_CONFIG.supabaseUrl, VERIFY_CONFIG.supabaseKey);
      console.log('✅ Supabase client initialized');
      return true;
    } catch (error) {
      console.error('❌ Failed to initialize Supabase client:', error.message);
      return false;
    }
  }

  async testDatabaseConnection() {
    console.log('\n🔍 Testing Database Connection...');

    try {
      const { data, error } = await this.supabase.from('rooms').select('count').limit(1);

      if (error) {
        this.results.database.failed++;
        this.results.database.details.push(`❌ Database connection failed: ${error.message}`);
        return false;
      }

      this.results.database.passed++;
      this.results.database.details.push('✅ Database connection successful');
      return true;
    } catch (error) {
      this.results.database.failed++;
      this.results.database.details.push(`❌ Database connection error: ${error.message}`);
      return false;
    }
  }

  async testTableSchemas() {
    console.log('\n🔍 Testing Table Schemas...');

    const tables = ['rooms', 'room_participants'];

    for (const table of tables) {
      try {
        const { data, error } = await this.supabase.from(table).select('*').limit(1);

        if (error) {
          this.results.database.failed++;
          this.results.database.details.push(`❌ Table ${table} access failed: ${error.message}`);
        } else {
          this.results.database.passed++;
          this.results.database.details.push(`✅ Table ${table} accessible`);
        }
      } catch (error) {
        this.results.database.failed++;
        this.results.database.details.push(`❌ Table ${table} error: ${error.message}`);
      }
    }
  }

  async testRoomCreation() {
    console.log('\n🔍 Testing Room Creation...');

    try {
      const roomData = {
        id: VERIFY_CONFIG.testRoomId,
        host_user_id: VERIFY_CONFIG.testUserId,
        host_username: 'verify-test-user',
      };

      const { data, error } = await this.supabase.from('rooms').insert(roomData).select();

      if (error) {
        this.results.database.failed++;
        this.results.database.details.push(`❌ Room creation failed: ${error.message}`);
        return false;
      }

      this.results.database.passed++;
      this.results.database.details.push(`✅ Room creation successful: ${data[0].id}`);
      return true;
    } catch (error) {
      this.results.database.failed++;
      this.results.database.details.push(`❌ Room creation error: ${error.message}`);
      return false;
    }
  }

  async testParticipantManagement() {
    console.log('\n🔍 Testing Participant Management...');

    try {
      // Add participant
      const participantData = {
        room_id: VERIFY_CONFIG.testRoomId,
        user_id: VERIFY_CONFIG.testUserId,
        is_host: true,
      };

      const { data: insertData, error: insertError } = await this.supabase
        .from('room_participants')
        .insert(participantData)
        .select();

      if (insertError) {
        this.results.database.failed++;
        this.results.database.details.push(`❌ Participant addition failed: ${insertError.message}`);
        return false;
      }

      // Verify participant exists
      const { data: checkData, error: checkError } = await this.supabase
        .from('room_participants')
        .select('*')
        .eq('room_id', VERIFY_CONFIG.testRoomId)
        .eq('user_id', VERIFY_CONFIG.testUserId);

      if (checkError || checkData.length === 0) {
        this.results.database.failed++;
        this.results.database.details.push('❌ Participant verification failed');
        return false;
      }

      this.results.database.passed++;
      this.results.database.details.push(`✅ Participant management successful`);
      return true;
    } catch (error) {
      this.results.database.failed++;
      this.results.database.details.push(`❌ Participant management error: ${error.message}`);
      return false;
    }
  }

  async testWebsocketConnection() {
    console.log('\n🔍 Testing WebSocket Connection...');

    return new Promise((resolve) => {
      const ws = new WebSocket(VERIFY_CONFIG.serverUrl);
      const startTime = performance.now();

      const timeout = setTimeout(() => {
        this.results.websocket.failed++;
        this.results.websocket.details.push('❌ WebSocket connection timeout');
        ws.terminate();
        resolve(false);
      }, VERIFY_CONFIG.connectionTimeout);

      ws.on('open', () => {
        clearTimeout(timeout);
        const connectionTime = performance.now() - startTime;

        this.results.websocket.passed++;
        this.results.websocket.details.push(`✅ WebSocket connection successful (${connectionTime.toFixed(2)}ms)`);

        ws.close();
        resolve(true);
      });

      ws.on('error', (error) => {
        clearTimeout(timeout);
        this.results.websocket.failed++;
        this.results.websocket.details.push(`❌ WebSocket connection error: ${error.message}`);
        resolve(false);
      });
    });
  }

  async testWebSocketAuthentication() {
    console.log('\n🔍 Testing WebSocket Authentication...');

    return new Promise((resolve) => {
      const ws = new WebSocket(VERIFY_CONFIG.serverUrl);
      let authReceived = false;

      const timeout = setTimeout(() => {
        if (!authReceived) {
          this.results.websocket.failed++;
          this.results.websocket.details.push('❌ WebSocket authentication timeout');
        }
        ws.terminate();
        resolve(authReceived);
      }, VERIFY_CONFIG.connectionTimeout);

      ws.on('open', () => {
        // Send auth message
        ws.send(JSON.stringify({
          type: 'auth',
          token: 'verify-test-token',
          roomId: VERIFY_CONFIG.testRoomId,
          role: 'guest'
        }));
      });

      ws.on('message', (data) => {
        try {
          const message = JSON.parse(data.toString());
          if (message.type === 'auth_result') {
            clearTimeout(timeout);
            authReceived = true;

            if (message.success) {
              this.results.websocket.passed++;
              this.results.websocket.details.push('✅ WebSocket authentication successful');
            } else {
              this.results.websocket.failed++;
              this.results.websocket.details.push(`❌ WebSocket authentication failed: ${message.error}`);
            }

            ws.close();
            resolve(authReceived);
          }
        } catch (error) {
          // Ignore JSON parse errors for other messages
        }
      });

      ws.on('error', (error) => {
        clearTimeout(timeout);
        this.results.websocket.failed++;
        this.results.websocket.details.push(`❌ WebSocket authentication error: ${error.message}`);
        resolve(false);
      });
    });
  }

  async testEndToEndFlow() {
    console.log('\n🔍 Testing End-to-End Integration...');

    try {
      // Test 1: Room exists in database
      const { data: roomData, error: roomError } = await this.supabase
        .from('rooms')
        .select('*')
        .eq('id', VERIFY_CONFIG.testRoomId);

      if (roomError || roomData.length === 0) {
        this.results.integration.failed++;
        this.results.integration.details.push('❌ Test room not found in database');
        return false;
      }

      this.results.integration.passed++;
      this.results.integration.details.push('✅ Room found in database');

      // Test 2: WebSocket can join room
      const joinSuccess = await this.testWebSocketRoomJoin();
      if (joinSuccess) {
        this.results.integration.passed++;
        this.results.integration.details.push('✅ WebSocket room join successful');
      } else {
        this.results.integration.failed++;
        this.results.integration.details.push('❌ WebSocket room join failed');
      }

      // Test 3: Database cleanup
      const cleanupSuccess = await this.testDatabaseCleanup();
      if (cleanupSuccess) {
        this.results.integration.passed++;
        this.results.integration.details.push('✅ Database cleanup successful');
      } else {
        this.results.integration.failed++;
        this.results.integration.details.push('❌ Database cleanup failed');
      }

      return true;
    } catch (error) {
      this.results.integration.failed++;
      this.results.integration.details.push(`❌ End-to-end test error: ${error.message}`);
      return false;
    }
  }

  async testWebSocketRoomJoin() {
    return new Promise((resolve) => {
      const ws = new WebSocket(VERIFY_CONFIG.serverUrl);
      let joinSuccess = false;

      const timeout = setTimeout(() => {
        ws.terminate();
        resolve(false);
      }, VERIFY_CONFIG.connectionTimeout);

      ws.on('open', () => {
        ws.send(JSON.stringify({
          type: 'auth',
          token: 'verify-test-token',
          roomId: VERIFY_CONFIG.testRoomId,
          role: 'guest'
        }));
      });

      ws.on('message', (data) => {
        try {
          const message = JSON.parse(data.toString());
          if (message.type === 'auth_result' && message.success) {
            clearTimeout(timeout);
            joinSuccess = true;
            ws.close();
            resolve(true);
          }
        } catch (error) {
          // Ignore JSON parse errors
        }
      });

      ws.on('error', () => {
        clearTimeout(timeout);
        resolve(false);
      });
    });
  }

  async testDatabaseCleanup() {
    try {
      // Remove test participants
      const { error: participantError } = await this.supabase
        .from('room_participants')
        .delete()
        .eq('room_id', VERIFY_CONFIG.testRoomId);

      if (participantError) {
        return false;
      }

      // Remove test room
      const { error: roomError } = await this.supabase
        .from('rooms')
        .delete()
        .eq('id', VERIFY_CONFIG.testRoomId);

      if (roomError) {
        return false;
      }

      return true;
    } catch (error) {
      return false;
    }
  }

  async cleanupTestData() {
    console.log('\n🧹 Cleaning up test data...');

    try {
      await this.testDatabaseCleanup();
      console.log('✅ Test data cleaned up');
    } catch (error) {
      console.warn('⚠️  Warning: Could not clean up test data:', error.message);
    }
  }

  printResults() {
    console.log('\n' + '='.repeat(80));
    console.log('📊 SUPABASE INTEGRATION VERIFICATION RESULTS');
    console.log('='.repeat(80));

    // Database results
    console.log('\n🗄️  DATABASE TESTS:');
    console.log(`✅ Passed: ${this.results.database.passed}`);
    console.log(`❌ Failed: ${this.results.database.failed}`);
    this.results.database.details.forEach(detail => console.log(`  ${detail}`));

    // WebSocket results
    console.log('\n🔌 WEBSOCKET TESTS:');
    console.log(`✅ Passed: ${this.results.websocket.passed}`);
    console.log(`❌ Failed: ${this.results.websocket.failed}`);
    this.results.websocket.details.forEach(detail => console.log(`  ${detail}`));

    // Integration results
    console.log('\n🔗 INTEGRATION TESTS:');
    console.log(`✅ Passed: ${this.results.integration.passed}`);
    console.log(`❌ Failed: ${this.results.integration.failed}`);
    this.results.integration.details.forEach(detail => console.log(`  ${detail}`));

    // Summary
    const totalPassed = this.results.database.passed + this.results.websocket.passed + this.results.integration.passed;
    const totalFailed = this.results.database.failed + this.results.websocket.failed + this.results.integration.failed;
    const totalTests = totalPassed + totalFailed;
    const successRate = totalTests > 0 ? ((totalPassed / totalTests) * 100).toFixed(2) : '0';

    console.log('\n📈 SUMMARY:');
    console.log(`📊 Total Tests: ${totalTests}`);
    console.log(`✅ Total Passed: ${totalPassed}`);
    console.log(`❌ Total Failed: ${totalFailed}`);
    console.log(`📊 Success Rate: ${successRate}%`);

    // Overall status
    const overallSuccess = totalFailed === 0;
    console.log(`\n🎯 OVERALL STATUS: ${overallSuccess ? '✅ ALL TESTS PASSED' : '❌ SOME TESTS FAILED'}`);

    if (!overallSuccess) {
      console.log('\n🚨 ACTION REQUIRED:');
      console.log('1. Fix failed tests before production deployment');
      console.log('2. Verify environment variables are correctly set');
      console.log('3. Check database permissions and RLS policies');
      console.log('4. Ensure WebSocket server is running');
    }

    return overallSuccess;
  }

  async runAllTests() {
    console.log('🚀 Starting Supabase Integration Verification');
    console.log(`📊 Supabase URL: ${VERIFY_CONFIG.supabaseUrl}`);
    console.log(`🔌 WebSocket URL: ${VERIFY_CONFIG.serverUrl}`);

    const initialized = await this.initialize();
    if (!initialized) {
      return false;
    }

    // Run all tests
    await this.testDatabaseConnection();
    await this.testTableSchemas();
    await this.testRoomCreation();
    await this.testParticipantManagement();
    await this.testWebsocketConnection();
    await this.testWebSocketAuthentication();
    await this.testEndToEndFlow();

    // Cleanup and results
    await this.cleanupTestData();
    const success = this.printResults();

    return success;
  }
}

// Main execution
async function main() {
  const verifier = new SupabaseVerifier();
  const success = await verifier.runAllTests();

  process.exit(success ? 0 : 1);
}

if (import.meta.url === `file://${process.argv[1]}`) {
  main().catch(console.error);
}

export { SupabaseVerifier };
