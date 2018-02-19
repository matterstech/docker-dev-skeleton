setup:
	cp .env.example .env
	sed -i "s/<DOCKER_USER_ID>/$(shell $(shell echo id -u ${USER}))/g" .env
	sed -i "s/<DOCKER_USER>/$(shell echo ${USER})/g" .env
	sed -i 's/<REMOTE_HOST>/$(shell hostname -I | grep -Eo "192\.168\.[0-9]{,2}\.[0-9]+")/g' .env