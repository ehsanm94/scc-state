FROM node:10.20.0-alpine
LABEL maintainer="Ehsan Mokhtari"

LABEL version="6.1.1"
LABEL description="Docker file for SCC State Server"

USER node
WORKDIR /home/node
COPY . .

RUN npm install --production

EXPOSE 7777

CMD ["npm", "start"]
