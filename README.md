# Docker skeletons for developments

This repository gather Docker and docker-compose skeletons for **development environments**.

* `app/` directory contains a sample "Hello World" php application.
* For now, we have only one `docker-compose.yml` for `php-fpm` and `nginx` images.


## Installation :

- `make setup`
- `docker-compose up -d`
- Add following entries in `/etc/hosts`

    ```
    # php-dev-skeleton
    127.0.0.1   php-docker.local 
    ```

    :notes: You should adapt with `SERVER_NAME` values in `.env`

- Done !


## URL :

- [http://php-docker.local:8080](http://php-docker.local:8080)


## Usages :

- `docker-compose run php bash`


## Run functional tests

- `docker-compose exec php bin/behat --config=behat/behat.yml`
