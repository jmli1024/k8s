#! /bin/bash

install_docker_compose() {
    curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod a+x /usr/local/bin/docker-compose
    docker-compose version
}

install_docker_compose
