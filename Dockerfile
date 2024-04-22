FROM node:alpine

WORKDIR /home/node/app

RUN chown -R node:node /home/node/app
COPY --chown=node:node package.json .
RUN npm install
COPY --chown=node:node . .

USER node

RUN npm run build

EXPOSE 3000
CMD [ "npm", "start"]
