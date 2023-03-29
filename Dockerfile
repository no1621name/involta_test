# syntax=docker/dockerfile:1

FROM node:18
ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /app
COPY package*.json ./
RUN yarn

COPY . .
RUN yarn run ci:pull_paragraph && yarn run tools:update

EXPOSE 3000
CMD yarn run devserver:start
