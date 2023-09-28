# Projeto Laravel Lorena

# hdcevents

* Link:
_https://github.com/LorenaManara/hdcevents_  
[https://github.com/LorenaManara/hdcevents](https://github.com/LorenaManara/hdcevents)  


### Inicializando o sistema
* Projeto requisitado pela Gazin Tech para aprendizado da linguagem Laravel

### Pré-Requisitos
* ter instalado o Docker
* ter instalado o composer
* ter o .env configurado certo

**Dependências:** 
```
- Docker
- Docker-compose
- Composer
```    

## [Git] Comecendo o Projeto

- Baixando o codigo com o `Git Clone`: `git clone https://github.com/LorenaManara/hdceven`

## [Docker] Comandos em Docker
- `docker build -t disgrama_o_retorno .`
- `docker compose up`

## Apos o docker-compose estar no ar
- `docker exec -it disgrama_o_retorno bash`

## Dentro do container
- `composer install`
- `php artisan key:generate`
- `php artisan migrate`
    Caso esteja executando com o init.sql vai dar erro no migrate mas nao precisa se preocupar
- `php artisan serve --host=0.0.0.0 --port=8001`
 
 