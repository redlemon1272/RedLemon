# Optimized Dockerfile for high-performance WebSocket service
FROM node:20-alpine AS base
WORKDIR /app

# Install build dependencies for native modules if needed
RUN apk add --no-cache python3 make g++

COPY package.json package-lock.json* tsconfig.json ./
RUN npm ci --only=production && npm cache clean --force

COPY src ./src
RUN npm run build

# Production stage with performance optimizations
FROM node:20-alpine
WORKDIR /app

# Performance: Remove unnecessary packages
RUN apk del --no-network python3 make g++

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

COPY --from=base /app/node_modules ./node_modules
COPY --from=base /app/dist ./dist

# Change to non-root user
USER nodejs

# Environment variables for performance tuning
ENV NODE_OPTIONS="--max-old-space-size=512"
ENV PORT=8080
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:8080/healthz', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

CMD ["node", "dist/index.js"]
