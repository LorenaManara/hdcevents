# Use a imagem oficial do PHP 8.2 FPM
FROM php:8.2-fpm

# Atualize os repositórios e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip

# Instale as extensões PHP necessárias
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

# Exponha a porta 8000 (opcional - ajuste conforme necessário)
EXPOSE 9000

# Comando de entrada para iniciar o servidor PHP-FPM
CMD ["php-fpm"]
