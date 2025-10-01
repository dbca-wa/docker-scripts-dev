#!/bin/bash

sudo groupadd -g 20000 container
sudo useradd -g 20000 -u 200000 container -s /bin/bash

sudo mkdir /home/container
sudo chown container:container /home/container
sudo usermod -aG docker container
sudo usermod -aG sudo  container

wget https://raw.githubusercontent.com/xzzy/docker-scripts-dev/refs/heads/main/windows_wsl/wsl_check_systemd.sh -O /tmp/wsl_check_systemd.sh
sudo chmod +x /tmp/wsl_check_systemd.sh
sudo /tmp/wsl_check_systemd.sh

sudo wget https://raw.githubusercontent.com/xzzy/docker-scripts-dev/refs/heads/main/windows_wsl/wsl_static_ip.sh -O /etc/wsl_static_ip.sh
sudo chmod +x /etc/wsl_static_ip.sh
sudo wget https://raw.githubusercontent.com/xzzy/docker-scripts-dev/refs/heads/main/windows_wsl/wsl-static-ip.service -O /etc/systemd/system/wsl-static-ip.service
sudo systemctl enable wsl-static-ip.service

sudo mkdir /data
sudo mkdir /data/data
sudo mkdir /data/data/projects
sudo mkdir /data/data/containerhome
sudo chown -R container:container /data/data

sudo su -c "su container -c 'ssh-keygen -t rsa -b 4096 -N \"\" -f ~/.ssh/id_rsa'"
sudo su -c "su container -c 'cat id_rsa.pub > ~/.ssh/authorized_keys'"
sudo su -c "su container -c 'chmod 0700 ~/.ssh/authorized_keys'"
