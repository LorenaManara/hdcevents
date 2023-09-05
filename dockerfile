# Use a imagem oficial do PHP 7.4 como imagem base
FROM php:7.4

# Atualize os repositórios e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip

# Instale o Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Defina o diretório de trabalho no contêiner
WORKDIR /var/www/html

# Copie o projeto Laravel para o diretório de trabalho no contêiner
COPY . .

# Instale as dependências do Laravel usando o Composer
RUN composer install

# Exponha a porta 8000 (opcional - ajuste conforme necessário)
EXPOSE 8000

# Comando de entrada para iniciar o servidor web Laravel usando o Laravel Artisan
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
