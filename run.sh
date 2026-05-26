#!/bin/bash
activate () {
    if [ -d "venv" ] 
    then
        echo "Python 🐍 environment was activated"
        source venv/bin/activate
    else
        echo "The folder environment doesn't exist"
        python3 -m venv venv
        source venv/bin/activate
        echo "The environment folder was created and the python 🐍 environment was activated"
    fi
}

install () {
    pip install -r requirements.txt
}

run () {
    export FLASK_APP=src/application.py
    if [ -z "$1" ]
    then
        flask run
    else
        flask run -p $1
    fi
}

docker-local-up () {
    docker compose -f docker-compose.local.yml up -d --build
}

docker-local-down () {
    docker compose -f docker-compose.local.yml down
}

podman-local-up () {
    podman compose -f docker-compose.local.yml up -d --build
}

podman-local-down () {
    podman compose -f docker-compose.local.yml down
}