FROM php:8.1-fpm-alpine AS php

RUN docker-php-ext-install pdo pdo_mysql sockets
RUN curl -sS https://getcomposer.org/installer | php -- \
     --install-dir=/usr/local/bin --filename=composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . .
RUN composer install

FROM node:18-alpine AS node

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD [ "npm", "run", "dev" ]