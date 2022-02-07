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

The default **PHP** version is **7.4**. To use a specific version use `phpX.Y` or `composerX.Y`:
```shell
php8.1 --version
composer8.1 install
```

## Updating images

To change the default **PHP** version, change the **bash_aliases** file:
```shell
alias php='phpX.Y'
alias composer='composerX.Y'
```

If you need to add more *PHP extensions*, add them to the `RUN` instruction in the **Dockerfile**. Refer to the
[mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer#supported-php-extensions)
support table.
Then rebuild the images:
```shell
make build
```

## How it works

**PHP** *Docker images* are built using `cli-alpine` base images, installing **Composer 2** and the `pdo_mysql` extension.
*Bash aliases* are used to call the right **Docker** commands to create a container. Every container is removed when stopped,
uses the host *UID:GID* and the host network. The current directory is mounted into the container.
Additionnally for **Composer**, a cache directory is mounted into the container too.

## Future targets

**Lodo** is functional but still looks like a draft. To make it easier to use, here are the few feature ideas to implement:

 - dynamic *PHP extensions* setup from an optional file
 - **Composer** version management
 - **PHP** version switch from the command line ([nvm](https://github.com/nvm-sh/nvm) style)
 - packaging as a single binary
