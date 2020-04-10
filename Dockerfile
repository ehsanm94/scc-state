FROM mhart/alpine-node:10 AS builder

WORKDIR /app
COPY package* ./

ENV NPM_CONFIG_LOGLEVEL info
RUN npm install -g npm \
    && npm install --production


FROM mhart/alpine-node:slim-10
LABEL maintainer="Ehsan Mokhtari"

LABEL version="6.1.1"
LABEL description="Docker file for SCC State Server"

RUN addgroup -g 1000 node \
    && adduser -u 1000 -G node -s /bin/sh -D node

USER node
WORKDIR /home/node
COPY --chown=node:node --from=builder /app .
COPY --chown=node:node . .

EXPOSE 7777

CMD ["node", "server.js"]