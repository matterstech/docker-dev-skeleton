.PHONY: setup composer.install db.install db.connect test.behat.run

#Setup automatically docker compose variables

.env:
	cp .env.example .env
	sed -i "s/<DOCKER_USER_ID>/$(shell $(shell echo id -u ${USER}))/g" .env
	sed -i "s/<DOCKER_USER>/$(shell echo ${USER})/g" .env
	sed -i 's/<REMOTE_HOST>/$(shell hostname -I | grep -Eo "192\.168\.[0-9]{,2}\.[0-9]+")/g' .env

setup: .env composer.install

composer.install:
	docker-compose run php composer install

#Installs the database : create table and fixtures. This is just an example to show how to run db script against
#the postgres container. You might decide to run script installation against the php container as well.
db.install:
	docker-compose exec postgres /bin/bash -c 'psql -U $$POSTGRES_USER -h localhost -f db/example.sql'

#Connects to the databatase
db.connect:
	docker-compose exec postgres /bin/bash -c 'psql -U $$POSTGRES_USER'

#Runs functional tests
test.behat.run:
	docker-compose exec php bin/behat --config=behat/behat.yml
