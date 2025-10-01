# Setup Instructions

NOTE: This is taking into account that WSL has been installed with version 2 on your windows machine. 

1. From a command prompt start the wsl instance with 
```
wsl --install Ubuntu-24.04
```
a). When the prompt ask you for the default user account enter "dockeradmin" and the press enter    
b). Enter a password at the next prompts   
<img width="898" height="232" alt="image" src="https://github.com/user-attachments/assets/696c47dd-0af9-44f6-96b5-19dab53a34ba" />   

2. Run the docker installation script    
```
curl https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/refs/heads/main/windows_wsl/docker-install.sh | bash
```
3. Configure WSL
```
curl https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/refs/heads/main/windows_wsl/configure_wsl.sh | bash
```
4. Copy the private key that is printed on screen and create a file in windows under C:\Users\<username>\.ssh\id_rsa and copy the content of the private key into this file there should be
carriage return at the end
<img width="356" height="80" alt="image" src="https://github.com/user-attachments/assets/a579f8be-7518-4508-b974-f1a0653025d8" />

5. Exit the ubuntu shell back to the command prompt
```
exit
```
6. In the command prompt shutdown wsl
```
wsl --shutdown
```
7. Start WSL Ubuntu instanace
```
wsl -d Ubuntu-24.04
```
8. Start WSL Ubuntu instanace
Run the following command to check the ip config matching the ip in the red box.  If matches your installation is completed
```
ifconfig
```
<img width="796" height="469" alt="image" src="https://github.com/user-attachments/assets/7e2a98eb-6f60-4e10-b040-0bc7f1ba39bf" />

9. Test SSH Key has been installed correctly by running the following command in command prompt.  If successfully you should be logged into your Ubuntu WSL instances
```
ssh -l container 172.29.16.10
```
   
<img width="955" height="499" alt="image" src="https://github.com/user-attachments/assets/c0941998-4c79-4fb7-9edf-e719cb5fd22e" />


# Re install Instructions (Doing this will remove your WSL ubuntu instance for a fresh install 
1.  Shutdown WSL instances
```
wsl --shutdown
```
2. Unregister to remove your WSL Ubuntu install
```
wsl --unregister Ubuntu-24.04
```
    

