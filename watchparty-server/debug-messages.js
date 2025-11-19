import WebSocket from 'ws';

const TEST_CONFIG = {
  serverUrl: 'ws://localhost:18081/ws',
  roomId: 'debug-room-messages',
  userId: 'debug-user'
};

const ws = new WebSocket(TEST_CONFIG.serverUrl);

ws.on('open', () => {
  console.log('🔗 Connected to server');

  // Send auth message
  ws.send(JSON.stringify({
    type: 'auth',
    token: 'test-token',
    roomId: TEST_CONFIG.roomId,
    role: 'guest'
  }));
});

ws.on('message', (data) => {
  const message = JSON.parse(data.toString());
  console.log('📨 Received:', JSON.stringify(message, null, 2));

  // After receiving auth_ok, send a heartbeat to test timestamps
  if (message.type === 'auth_ok') {
    console.log('✅ Auth successful, sending heartbeat...');
    ws.send(JSON.stringify({
      type: 'heartbeat',
      positionMs: 12345,
      playing: true,
      clientTimestamp: Date.now()
    }));
  }
});

ws.on('error', (error) => {
  console.error('❌ WebSocket error:', error);
});

ws.on('close', () => {
  console.log('🔌 Connection closed');
});

// Close after 5 seconds
setTimeout(() => {
  ws.close();
  process.exit(0);
}, 5000);
