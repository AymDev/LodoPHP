setup: build
	mkdir ./composer-cache

build:
	docker buildx build --pull -t aymdev-php:7.1 -f ./Dockerfile --build-arg PHP_VERSION=7.1 --build-arg ALPINE_VERSION=3.10 .
	docker buildx build --pull -t aymdev-php:7.2 -f ./Dockerfile --build-arg PHP_VERSION=7.2 --build-arg ALPINE_VERSION=3.12 .
	docker buildx build --pull -t aymdev-php:7.3 -f ./Dockerfile --build-arg PHP_VERSION=7.3 .
	docker buildx build --pull -t aymdev-php:7.4 -f ./Dockerfile --build-arg PHP_VERSION=7.4 .
	docker buildx build --pull -t aymdev-php:8.0 -f ./Dockerfile --build-arg PHP_VERSION=8.0 .
	docker buildx build --pull -t aymdev-php:8.1 -f ./Dockerfile --build-arg PHP_VERSION=8.1 --build-arg ALPINE_VERSION=3.15 .
