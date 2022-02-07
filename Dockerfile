ARG PHP_VERSION
ARG ALPINE_VERSION=3.13

FROM php:${PHP_VERSION}-cli-alpine${ALPINE_VERSION}
WORKDIR /srv/app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=mlocati/php-extension-installer:latest /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions pdo_mysql

ENTRYPOINT ["php"]
CMD ["--help"]
