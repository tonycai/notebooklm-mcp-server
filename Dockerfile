# Stage 1: Build
FROM node:20-slim AS builder

WORKDIR /app

COPY package.json package-lock.json ./
# Skip playwright chromium download — not needed for server mode
RUN npm ci --ignore-scripts

COPY tsconfig.json build.js ./
COPY src/ src/
RUN npm run build

# Stage 2: Production
FROM node:20-slim

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev --ignore-scripts && npm cache clean --force

COPY --from=builder /app/dist/ dist/

# Auth data is mounted at runtime from the host
VOLUME /root/.notebooklm-mcp

# MCP server communicates over stdio
ENTRYPOINT ["node", "dist/index.js"]
CMD ["server"]
