# create network
network:
	@docker network create tech_api_net 

# build images for all services
build_all:
	@docker-compose build

# build service
	@docker-compose build service=$(service)

# start all services
start:
	@docker-compose up

# add package
package:
	@docker-compose exec api /app/start_app.sh package $(package)
