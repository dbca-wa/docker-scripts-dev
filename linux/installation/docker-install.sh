#!/bin/bash
sudo apt update
sudo apt install openssh-server -y
sudo apt install apt-transport-https curl gnupg-agent ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker docker
newgrp docker
docker version
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl restart docker

# For Linux
sudo groupadd -g 20000 container
sudo useradd -g 20000 -u 200000 container -s /bin/bash

sudo mkdir /home/container
sudo chown container.container /home/container
sudo usermod -aG docker container
sudo usermod -aG sudo  container

sudo mkdir /linuxdata/
sudo mkdir /data/
sudo mkdir /data/data
sudo mkdir /container-data/
sudo chown -R container.container /data
sudo chown -R container.container /linuxdata
sudo chown -R container.container /container-data
