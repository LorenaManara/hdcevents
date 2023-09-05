# FROM wyveo/nginx-php-fpm:latest

# Use a imagem oficial do PHP 7.4 como imagem base
FROM php:8.2-fpm

# Atualize os repositórios e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip

RUN docker-php-ext-install pdo pdo_mysql

# Instale o Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Defina o diretório de trabalho no contêiner
WORKDIR /var/www/html

# Copie o projeto Laravel para o diretório de trabalho no contêiner
COPY . .

# Instale as dependências do Laravel usando o Composer
RUN composer install
RUN composer global require laravel/installer
RUN php artisan key:generate
RUN php artisan cache:clear
RUN php artisan config:cache

# Exponha a porta 8000 (opcional - ajuste conforme necessário)
EXPOSE 9000

# Comando de entrada para iniciar o servidor web Laravel usando o Laravel Artisan
CMD ["php-fpm"]

