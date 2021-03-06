FROM node:10.19.0-alpine

ENV NODE_ENV production

RUN npm install -g pm2

RUN npm install -g grunt-cli

RUN yarn global add knex-migrator ember-cli bower

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache git

RUN yarn setup

RUN grunt prod

EXPOSE 2368

CMD ["pm2-runtime", "ecosystem.config.js", "--env", "production"]

