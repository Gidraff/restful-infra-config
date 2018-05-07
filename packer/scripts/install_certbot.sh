#!/bin/bash

set -eux

get_certbot(){
    # add certbot ppa(personal package archive) to source list
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt-get update
    sudo apt-get install -y python-certbot-nginx
}

install_nginx(){
    sudo apt-get update
    sudo apt-get install -y nginx
}


main(){
    get_certbot
    install_nginx
}

main