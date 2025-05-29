FROM oven/bun:1

WORKDIR /usr/src/app

# layer optimization not done yet

COPY ./packages ./packages
COPY ./bun.lock ./bun.lock
COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./apps/websocket ./apps/websocket

# or 

# COPY . .

RUN bun install

# RUN packages/db && npx prisma generate && cd ../..
# or add this as a script in package.json

RUN bun run generate:db

EXPOSE 8080

CMD ["bun", "start:ws"]

