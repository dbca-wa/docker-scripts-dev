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
```

# Crontab Docker Image and Log cleanup
00 11  * * 0   root journalctl --vacuum-size=100M
30 11    * * *   root docker system prune -f --all

# Virtual Box (Linux issue)

# Question 1. Error Error: ENOSPC: System limit for number of file watchers reached, watch
# Answer   1.  Increase max user watches
```
1. Login to virtual machine using putty   
2. sudo su (Need root access)   
3. Run this command in the root shell    
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p    
4. Check that the number matches 524288   
cat /proc/sys/fs/inotify/max_user_watches  
```
