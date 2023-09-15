FROM node:17-alpine 

WORKDIR /var/www

COPY package.json .

RUN npm i

COPY . .

RUN npm install

RUN sail npm run dev

FROM nginx

COPY ./docker/nginx/laravel.conf /etc/nginx/laravel.conf
