FROM node:10
ARG steam_api_key

RUN test -n "$steam_api_key"

COPY . /screeps
WORKDIR /screeps

RUN npm install screeps/screeps

RUN echo ${steam_api_key} | npx screeps init /screeps-data

WORKDIR /screeps-data
CMD ../screeps/node_modules/.bin/screeps start
