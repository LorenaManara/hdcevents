# Estágio 1: Construir o aplicativo Node.js
FROM node:17-alpine AS node_app

WORKDIR /var/www

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Estágio 2: Construir a imagem final com o aplicativo PHP e Nginx
FROM nginx:alpine

COPY ./docker/nginx/laravel.conf /etc/nginx/laravel.conf

# Copiar o aplicativo Node.js construído do primeiro estágio para o diretório de destino no segundo estágio
COPY --from=node_app /var/www/public /var/www/public

# Estágio 3: Configurar o ambiente PHP (adapte isso de acordo com suas necessidades)
# Estágio 2: Configurar o ambiente PHP (adapte isso de acordo com suas necessidades)
FROM php:8.1-fpm AS php_app

# Defina as variáveis de usuário e UID
ARG user=lorena
ARG uid=1000

# Habilitar a extensão pdo_mysql
RUN docker-php-ext-install pdo_mysql

# Resto do Dockerfile para configurar o ambiente PHP
# Certifique-se de adicionar as instruções necessárias para configurar o PHP aqui.

# Copiar o executável do composer da imagem oficial do composer para dentro do container.
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Adiciona um novo usuário ao container, aos grupos www-data, root e ao diretório /home/$user.
# (Importante adicionar o usuário ao diretório para evitar problemas de permissões ao dar manutenção dentro dos diretórios do container.)
RUN useradd -G www-data,root -u $uid -d /home/$user $user

# Cria o diretório /.composer no diretório do usuário (mkdir -p /home/$user/.composer).
# Também define o usuário e o grupo donos do diretório (chown -R $user:$user /home/$user);
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Define o diretório de trabalho.
WORKDIR /var/www

# Define o usuário padrão para todas as execuções no container.
USER $user