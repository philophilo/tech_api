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
    # start app with gurnicorn and reload for development
    gunicorn --bind :8000 --workers 3 --reload api.wsgi --log-level debug --access-logfile -
	cd /app
}

function add_package {
	info "adding package"
	pip install $1
	pip freeze > /app/requirements.txt
}

function django_shell {
    info "Running Django shell"
    python manage.py shell -i ipython
}

if [[ $1 == "start" ]];
then
    start_app
elif [[ $1 == "package" ]];
then
	add_package $2
elif [[ $1 == "django_shell" ]];
then
    django_shell
else
    error "Unknown parameter \`$1\`"
fi
