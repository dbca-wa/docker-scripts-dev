#!/bin/bash
sudo apt update
sudo apt install apt-transport-https curl gnupg-agent ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo apt install ssh net-tools

newgrp docker
docker version
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl restart docker

echo "Run configure wsl with the below command to configure wsl"
echo "curl https://raw.githubusercontent.com/xzzy/docker-scripts-dev/refs/heads/main/windows_wsl/configure_wsl.sh | bash" 
