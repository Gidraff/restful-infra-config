#!/bin/bash -e

add_repo(){
    wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
    echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
}

fireup_jenkins(){
    sudo apt-get update
    sudo apt-get install jenkins
    sudo systemctl start jenkins
}

setup_firewall(){
    sudo ufw allow 8080
}

main(){
    add_repo
    fireup_jenkins
    setup_firewall
}