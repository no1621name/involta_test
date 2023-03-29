# syntax=docker/dockerfile:1

FROM node:18

WORKDIR /app
COPY package*.json ./
RUN yarn

COPY . .

EXPOSE 3000
ENV NODE_OPTIONS=--openssl-legacy-provider
CMD yarn run devserver:start