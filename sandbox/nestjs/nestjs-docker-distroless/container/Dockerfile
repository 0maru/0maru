FROM node:18.9.0-bullseye-slim as dependencies
WORKDIR /app
RUN corepack enable
COPY package.json pnpm-lock.yaml .npmrc ./
RUN pnpm install

FROM node:18.9.0-bullseye-slim as builder
WORKDIR /app
RUN corepack enable
COPY . .
COPY --from=dependencies /app/node_modules ./node_modules
RUN pnpm build

FROM gcr.io/distroless/nodejs:18 as runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT 8012
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/node_modules ./node_modules
CMD ["dist/main"]
