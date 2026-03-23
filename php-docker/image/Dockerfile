ARG PHP_VERSION=8.3
FROM php:${PHP_VERSION}-cli

# Системные зависимости под типичный Symfony-стек и расширения
RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip zip ca-certificates curl \
    libicu-dev \
    libzip-dev zlib1g-dev \
    libxml2-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev \
    libpq-dev \
    libssl-dev \
  && rm -rf /var/lib/apt/lists/*

# PHP extensions (часто нужные для Symfony/Doctrine/Console/Messenger)
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) \
     intl zip \
     pdo_mysql pdo_pgsql \
     bcmath pcntl sockets gd

# Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Redis (phpredis)
RUN pecl install redis && docker-php-ext-enable redis

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

WORKDIR /app
