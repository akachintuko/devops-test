FROM node:16-alpine3.11

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm  install

COPY --chown=node:node . .

ENV PORT=3000 

RUN npm run build

EXPOSE ${PORT}

CMD [ "npm", "start" ]
