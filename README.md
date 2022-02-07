# Lodo PHP

Local **Docker** setup to use **PHP CLI** without installing it on the host OS.
It provides **Composer 2** and **PHP** from **7.1** to **8.1**.

**Requirements:**

 - **make**
 - **Docker** with **BuildKit** support

>Or you can just copy and edit what's in the **Makefile**.

## Installation

Clone the repository, then run `make setup` to build the *Docker images* and create the **Composer** cache directory.
Then add a `source` command to your `~/.bashrc` file:
```shell
source ~/path/to/LodoPHP/bash_aliases
```

## Usage

The default **PHP** version is **7.4**, the default **Composer** version is **2**. To use a specific **PHP** version use `phpX.Y` or `composerX.Y`:
```shell
# PHP 7.4
php --version
# PHP 8.1
php8.1 --version
# Composer 2 using PHP 8.1
composer8.1 install
```

## Configuration

To change the default **PHP** version, change the **bash_aliases** file:
```shell
alias php='phpX.Y'
alias composer='composerX.Y'
```

You can also create a **lodo.conf** file in the repository and then rebuild the images:
```shell
make build
```

### Install additionnal PHP extensions:

```conf
extensions="pdo_mysql xdebug"
```
>Refer to the
[mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer#supported-php-extensions)
support table.

### Define the Composer version

```conf
composer_version="2.2.6"
```
>Refer to the [Composer image tags](https://hub.docker.com/_/composer) on Docker Hub.

## How it works

**PHP** *Docker images* are built using `cli-alpine` base images, installing **Composer**.
*Bash aliases* are used to call the right **Docker** commands to create a container. Every container is removed when stopped,
uses the host *UID:GID* and the host network. The current directory is mounted into the container.
Additionnally for **Composer**, a cache directory is mounted into the container too.

## Future targets

**Lodo** is functional but still looks like a draft. To make it easier to use, here are the few feature ideas to implement:

 - **PHP** version switch from the command line ([nvm](https://github.com/nvm-sh/nvm) style)
 - packaging as a single binary
