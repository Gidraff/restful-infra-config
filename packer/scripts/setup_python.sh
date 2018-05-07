#!/bin/bash 

set -eux


main(){
    # keep system up-to-date
    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt install -y python2.7 python-pip
    sudo apt-get install -y python3-pip
    sudo apt install -y libpq-dev python3-dev
    sudo pip3 install virtualenv 
}

main