# Simple Dockerfile for watchparty WebSocket service
FROM node:20-alpine AS base
WORKDIR /app

COPY package.json package-lock.json* tsconfig.json ./
RUN npm install

COPY src ./src
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=base /app/node_modules ./node_modules
COPY --from=base /app/dist ./dist

ENV PORT=8080
EXPOSE 8080
CMD ["node", "dist/index.js"]
