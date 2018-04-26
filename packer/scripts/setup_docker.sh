#!/bin/bash -e


add_repo(){
    wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
    echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
}

fireup_jenkins(){
    sudo apt-get update
    sudo apt-get install -y jenkins
    sudo systemctl start jenkins
}

setup_firewall(){
    sudo ufw allow 8080
}



add_docker_repo(){
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
}

install_docker(){
    apt-cache policy docker-ce
    sudo apt-get install -y docker-ce
}


add_jenkins_to_docker_group(){
    sudo usermod -aG docker jenkins
}

main(){
    add_repo
    fireup_jenkins
    setup_firewall
    add_docker_repo
    install_docker
    add_jenkins_to_docker_group
}

main