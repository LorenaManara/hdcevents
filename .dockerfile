FROM node:18.17.1

WORKDIR /usr/app

COPY ./ /usr/app

RUN npm install

EXPOSE 3000

CMD [ "npm","run", "dev" ]