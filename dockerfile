# Use a imagem PHP oficial do Docker como base
FROM php:8.1-fpm

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip pdo pdo_mysql

# Configure as extensões do PHP e opções do PHP.ini, se necessário

# Defina o diretório de trabalho como o diretório raiz do Laravel
WORKDIR /var/www/html

# Copie o código-fonte do seu projeto Laravel para o contêiner
COPY . /var/www/html

# Instale as dependências do Composer (certifique-se de que o composer seja instalado em sua máquina local)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Exponha a porta 8000 para que o servidor web embutido do Laravel possa ser acessado
EXPOSE 8000


