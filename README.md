# Configuration

```
Main Webdav directory : /data/data/ <projects> /
 
SSH Terminal/Putty :  ssh -l docker 10.17.0.10
```

# Generate SSH Key
```
ssh-keygen -t rsa -b 4096

vi ~/.ssh/authorized_keys <-- add public key here
```

# VS Code  .ssh/config 
```
Host 10.17.0.1
  HostName 10.17.0.1
  User docker
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519
