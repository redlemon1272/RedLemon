# Optimized Dockerfile for high-performance WebSocket service
FROM node:20-slim AS base
WORKDIR /app

# Install build dependencies for native modules if needed
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json* tsconfig.json ./
RUN npm ci && npm cache clean --force

COPY src ./src
RUN npm run build

# Production stage with performance optimizations
FROM node:20-slim
WORKDIR /app

# Create non-root user for security
RUN groupadd -g 1001 nodejs && \
    useradd -r -u 1001 -g nodejs nodejs

COPY --from=base /app/node_modules ./node_modules
COPY --from=base /app/dist ./dist

# Change to non-root user
USER nodejs

# Environment variables for performance tuning
ENV NODE_OPTIONS="--max-old-space-size=512"
ENV PORT=18081
EXPOSE 18081

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:18081/healthz', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

CMD ["node", "dist/index.js"]
