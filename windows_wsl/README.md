# Setup Instructions

1. From a command prompt start the wsl instance with 
```
wsl --install Ubuntu-24.04
```
a). When the prompt ask you for the default user account enter "dockeradmin" and the press enter    
b). Enter a password at the next prompts   
<img width="898" height="232" alt="image" src="https://github.com/user-attachments/assets/696c47dd-0af9-44f6-96b5-19dab53a34ba" />   

2. Run the docker installation script    
```
curl https://raw.githubusercontent.com/xzzy/docker-scripts-dev/refs/heads/main/windows_wsl/docker-install.sh | bash
```

3. Exit the ubuntu shell back to the command prompt
```
exit
```
4. In the command prompt shutdown wsl
```
wsl --shutdown
```
5. Start WSL Ubuntu instanace
```
wsl -d Ubuntu-24.04
```



