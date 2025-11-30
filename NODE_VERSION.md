# RedLemon Node.js Version Requirements

## Required Version
**Node.js 20 LTS, 22, or 25**

## Why This Matters
The watchparty server uses `uWebSockets.js`, which requires specific Node.js versions. Using an unsupported version will cause the server to fail with:
```
Error: This version of uWS.js supports only Node.js LTS versions...
```

## Installation

### Using NVM (Recommended)
```bash
# Install Node 20 LTS
nvm install 20
nvm use 20

# Or use the .nvmrc file
nvm use
```

### Direct Installation
Download Node.js 20 LTS from: https://nodejs.org/

## Verification
```bash
node --version  # Should show v20.x.x or v22.x.x
```

## Compatibility
- ✅ **Node 20 LTS**: Fully supported (recommended)
- ✅ **Node 22**: Supported
- ✅ **Node 25**: Supported
- ❌ **Node 26+**: Not yet supported by uWebSockets.js
- ❌ **Node 18 and below**: Deprecated

## Automatic Checking
The `start-production.sh` script will automatically verify your Node.js version and display an error if incompatible.
