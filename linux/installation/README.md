**Step 1. Install Docker**

a) Enter the following command into the linux terminal screen and press enter. You should be able to copy and paste the following command.
```
curl https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/main/linux/installation/docker-install.sh | bash
```

**Step 2. Setup SSH Keys**

a) under the user account which you use ubuntu create an ssh key with the following command.  (if you already have an ssh key than you can skip this step) 
to check if you have and ssh key run the following account from your user account terminal

```
ls -al ~/.ssh/
```
b) You should see two files is_rsa and id_rsa.pub  if you dont see these two files than you will need to create some ssh keys

use the following command to generate an ssh key

```
ssh-keygen -t rsa -b 4096
```

Press enter on all three questions that are asked (no input required)

```
Enter file in which to save the key (/home/user/.ssh/id_rsa):    
Enter passphrase (empty for no passphrase):    
Enter same passphrase again:    
```
c) Now we need to setup a authorized_keys file.  This will need to be created in /home/container/.ssh

d) open /home/<- user ->/.ssh/id_rsa.pub (we will want to copy and paste this shortly)
  
e) in terminal prompt

```
sudo su container
cd ~
mkdir /home/container/.ssh 
chmod 0700 /home/container/.ssh
vi ~/.ssh/authorized_keys <-- copy the public key from /home/<user>/.ssh/id_rsa.pub into here and save the file
chmod 0700 ~/.ssh/authorized_keys
```

f) Test SSH is setup correctly.
exit back to desktop user account prompt and then run this command to check
```
ssh container@localhost
```
You should be ask a question about continuing to connect,  type yes and press enter.
You prompt should automatically change to user container and no password should be asked.

**Network Configuration**   
   
vi /etc/netplan/01-network-manager-all.yaml   

```
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    eth0:
      dhcp4: true
  bridges:
    br0:
      interfaces: [eth0]
      addresses: [10.17.0.10/32]
      mtu: 1500
      nameservers:
        addresses: [8.8.8.8]
      parameters:
        stp: true
        forward-delay: 4
      dhcp4: no
      dhcp6: no
 
```
  
  
