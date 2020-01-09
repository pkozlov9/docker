#Environment
ENV                     := dev
DB_NAME                 := homestead

#Docker Names
DOCKER_PROJECT          := company_$(ENV)
DOCKER_SERVER           := company_server_$(ENV)
DOCKER_DB               := company_db_$(ENV)
DOCKER_SERVER_USER      := web-server

#Init Config Files
DB_INIT                 := docker/db/sql/db_init_$(ENV).sql
DB_DUMP                 := docker/db/sql/db_dump.$(ENV).sql

PRE_INSTALL_ENV         := docker/server/script/pre-install.$(ENV).sh
DOCKER_COMPOSE          := docker/docker-compose.yml
DOCKER_COMPOSE_ENV      := docker/docker-compose.$(ENV).yml

#Service Logs
PHP_ERROR_LOG           := /var/log/php/error.log
MYSQL_LOG               := /var/log/mysql/error.log
FRAMEWORK_LOG           := /var/www/storage/logs/laravel.log

up:
	docker-compose -p $(DOCKER_PROJECT) -f $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_ENV) up -d --force-recreate

up-build:
	docker-compose -p $(DOCKER_PROJECT) -f $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_ENV) up --build -d --force-recreate

down:
	docker-compose -p $(DOCKER_PROJECT) -f $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_ENV) down -v

sh-server:
	@docker exec -it $(DOCKER_SERVER) /bin/bash

sh-db:
	docker exec -it $(DOCKER_DB) /bin/bash

log-server:
	docker logs -f $(DOCKER_SERVER)

log-db:
	docker logs -f $(DOCKER_DB)

log-php:
	docker exec $(DOCKER_SERVER) /usr/bin/tail -f $(PHP_ERROR_LOG)

log-mysql:
	docker exec $(DOCKER_DB) /usr/bin/tail -f $(MYSQL_LOG)

log-framework:
	docker exec $(DOCKER_SERVER) /usr/bin/tail -f $(FRAMEWORK_LOG)

db-init:
	cat $(DB_INIT) | docker exec -i $(DOCKER_DB) mysql -u root

db-dump:
	cat $(DB_DUMP) | docker exec -i $(DOCKER_DB) mysql -u root -D $(DB_NAME)

db-migrate:
	docker exec -it --user $(DOCKER_SERVER_USER) $(DOCKER_SERVER) php artisan migrate --force

clean:
	sudo rm -rf .env storage/logs/laravel.log docker/db/data docker/server/xhprof/xhprof_runs vendor

composer-install:
	docker exec --user $(DOCKER_SERVER_USER) $(DOCKER_SERVER) composer install

pre-install:
	sudo docker/server/script/pre-install.sh

pre-install-env:
	sudo $(PRE_INSTALL_ENV)

add-hosts:
	sudo docker/server/script/add-hosts.sh

install: clean pre-install pre-install-env up-build composer-install db-init db-migrate db-dump

.PHONY: $(MAKECMDGOALS)