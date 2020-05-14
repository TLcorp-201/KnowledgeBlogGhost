FROM node:10.19.0-alpine

RUN npm install -g pm2

RUN yarn global add knex-migrator grunt-cli ember-cli bower

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache git

RUN yarn setup

RUN grunt prod

EXPOSE 2368

CMD ["pm2-runtime", "ecosystem.config.js", "--env", "production"]

