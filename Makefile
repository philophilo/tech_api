# create network
network:
	@docker network create tech_api_net 

# build images for all services
build_all:
	@docker-compose build

# build service
build:
	@docker-compose build $(service)

# start all services
start:
	@docker-compose up

# add package
pip_install:
	@docker-compose exec api /app/start_app.sh package $(package)

# run django shell
django_shell:
	@docker-compose exec api /app/start_app.sh django_shell

# open container shell
shell:
	@docker-compose exec api /bin/bash
