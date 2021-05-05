#!/usr/bin/env bash

# set colors for text
BOLD='\e[1m'
BLUE='\e[34m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[92m'
NC='\e[0m'

# set text formats
info() {
    printf "\n${BOLD}${BLUE}====> $(echo $@ ) ${NC}\n"
}

warning () {
    printf "\n${BOLD}${YELLOW}====> $(echo $@ )  ${NC}\n"
}

error() {
    printf "\n${BOLD}${RED}====> $(echo $@ )  ${NC}\n"
    bash -c "exit 1"
}

success () {
    printf "\n${BOLD}${GREEN}====> $(echo $@ ) ${NC}\n"
}

cd /app/api/
export $(cat .env | xargs)

# start app with gunicorn
function start_app {
    info "Starting api"
	python manage.py runserver 0.0.0.0:8000
	cd /app
}

function add_package {
	info "adding package"
	pip install $1
	pip freeze > /app/requirements.txt
}


if [ $1 == "start" ];
then
    start_app
elif [ $1 == "package" ];
then
	add_package $2
else
    error "Unknown parameter \`$1\`"
fi
