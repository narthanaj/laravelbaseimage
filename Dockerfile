# Dockerfile to create a base image with Ubuntu 22.04 and PHP
# Filename: Dockerfile-base

# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set a working directory
WORKDIR /var/www/html

# Install PHP and necessary extensions
RUN apt-get update -y && apt-get install -y \
    software-properties-common \
    curl \
    zip \
    unzip \
    git \
    && add-apt-repository ppa:ondrej/php -y \
    && apt-get update -y \
    && apt-get install -y \
        php8.1 \
        php8.1-cli \
        php8.1-fpm \
        php8.1-mbstring \
        php8.1-xml \
        php8.1-mysql \
        php8.1-pgsql \
        php8.1-sqlite \
        php8.1-curl \
        php8.1-bcmath \
        php8.1-gd \
        php8.1-zip \
        php8.1-intl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Expose port 9000
EXPOSE 9000