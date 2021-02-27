FROM node:10
ARG steam_api_key

RUN test -n "$steam_api_key"

COPY . /screeps
WORKDIR /screeps

RUN npm install screeps/screeps

RUN echo ${steam_api_key} | screeps init /screeps-data

CMD npx screeps start --db /screeps-data/db.json --assetdir /screeps-data/assets --modfile /screeps-data/mods.json --steam_api_key ${steam_api_key} --logdir /screeps-data/logs
