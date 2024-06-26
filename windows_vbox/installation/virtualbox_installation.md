### Installing Virtual Environment
   
**Step 1. Install Virtual Box**

https://www.virtualbox.org/wiki/Downloads

**Step 2: Setup Host Adapter**

Click File --> Tools --> Network Manager

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/077ca34e-4a26-4b59-80ba-d47a33b7f9e8)


a) Click Create and then Select the Adapter ending with #2.  
b) In the bottom box change the adapter IPV4 address to 10.17.0.1.   
c) Click Apply and Close.   

![alt text](https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/main/windows_vbox/installation/images/file__host_network_adapter.png)


**Step 3: Create New VM**

a) Click Machine --> NEW Button

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/7426d818-8cd6-41a1-b5e7-25a10d024992)

**Step 4 a): Create New VM Naming**

a) Enter under Name "Ubuntu 22.04 (docker)  
b) Select ISO image (the ubuntu image you downloaded)
c) Drop down should match screenshot   
d) Click Next   

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/4766add3-0aaa-4dfc-b2fd-061fcfe34f83)

**Step 4 b): Set hostname**

a) Adjust hostname 
b) Click next

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/350cb463-f3a2-4422-b947-fbdf97e33465)

**Step 5: Create New VM Memory**

a) Enter memory above 2048 of Memory (you can choose more if you wish)  
b) choose 1 of more cpus 
c) Click Next   

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/39e66fc8-45af-4521-b70b-ad600dea9497)

**Step 6: Create New VM Hard disk file type**

a) Select Create a Virtual Hard Disk Now   
b) Choose an sufficient amount.   
c) Click Next   

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/40f88652-78ba-429a-a32b-085c4efd8b8e)

**Step 7: Summary**

a) Click Finish
b) if the virtual machine begins to start click the cross on the window and choose power off (3rd option)

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/3122f6d6-8a03-4f93-8a17-72999bcf3f30)

**Step 8: VM Settings**

a) Select the New VM Created from the left panel   
b) Click Settings from the top bar.   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_vm_settings.png?raw=true)

**Step 9: VM Acceleration**

a) Select System   
b) Select Acceleration   
c) Change Paravirtualization Interface to "KVM"  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_system_acceleration.png?raw=true)


**Step 10: VM Storage Settings**

a) Select Storage   
b) Select Ubuntu 22.04 (docker).vdi
c) Check Solid State Drive 

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_storage_controller_sata.png?raw=true)

**Step 11: VM Select Installation Media**

a) Select Storage   
b) Select Empty under Controller: IDE    
c) Select Disk icon on the right and choose the download ubuntu 22.04-live-server image.    (choose your ubuntu install iso image if not already selected)    

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_storage_controller_install_image.png?raw=true)

**Step 12: Add additional network adapter**

a) Select Network on the left side menu    
b) click adapter 2 tab   
c) Tick Enable Network Adapter
d) Click attached to dropdown and select Host-only Adapter
e) In Name dropdown select VirtualBox Host-Only Ethernet Adapter #2
f) click ok    

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/9d3d6a71-c7a2-42bb-821b-f444812eb04d)

**Step 13: VM Start**

a) Select "Ubuntu 22.04 (docker)"   
b) Click Start   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%201.png?raw=true)

**Step 14: VM Running**

a) Select (with aarow keys) "Try or Install Ubunutu Server    
b) Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%202.png?raw=true)

**Step 15: VM Language**

a) Select (with aarow keys) "English"   
b) Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%203.png?raw=true)

**Step 16: VM Update Installer**

a) Select "Update to the new installer" - May not get this option if you image is already the latest.  If so skip to next step   
b) Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%204.png?raw=true)

**Step 17: VM Key Board Layout**

a) Both Layout and Variant should be English (US)   
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%205.png?raw=true)

**Step 18: VM Install Type**

a) X should be selected on Ubuntu Server   
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%206.png?raw=true)

**Step 19: VM Network**

a) Should see two network adapters    
b) using arrow keys on keyboard go to second adapter (without ip address) eg enp0s8 and select the interface (using enter) and choose Edit IPV4    
c) change IPv4 Method from Automatic to manual    
d) Into Subnet field enter 10.17.0.0/24    
e) Into Address field enter 10.17.0.10    
f) Select Save    
g) Select Done    

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/af29d78f-e7ac-4217-af26-d4e8424e6794)

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/3f3069b8-0ee1-4b8d-b9f5-c54427f841bc)

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/3e2baa5f-db80-4568-82a6-f91a5821531d)

**Step 20: VM Proxy**   

a) Proxy Address should be empty     
b) Select Done and Press Enter    

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%208.png?raw=true)    


**Step 21: VM Ubuntu Mirror Location**    

a) Mirror address should be an au archive.     
b) Select Done and Press Enter    

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%209.png?raw=true)    


**Step 22: Installer Update available**   

This screen may not appear if your using the latest ubuntu iso image.   

a) Select update to the new installer    

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/3979396c-53ad-4e6a-a037-0cd89e6d11a9)

**Step 23: VM Configure Storage**

a) X should match selection in screenshot    
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2010.png?raw=true)

**Step 24: VM Configure Storage Space**

a) In the screenshot where is says LVM volume group (make note of that numberm we will need it in the next step)   
b) Using the arrow keys select the number next to mounted at /   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2011.png?raw=true)

**Step 25: VM Configure Storage Space Amount**

a) In the size box enter the amount you wrote down in Step 25.   
b) Select Save and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2012.png?raw=true)

**Step 26: VM Configure Storage Complete**

a) Select Save and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2013.png?raw=true)


**Step 27: VM Configure Storage Confirm**

a) Select Continue and Press Enter      

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2014.png?raw=true)


**Step 28: VM Profile Setup**

a) Under Name Enter "Docker Admin"   
b) Under Your server name Enter "Docker"   
c) Under Username Enter "dockeradmin"   
d) Under Choose a password Enter "dockeradmin"   (you can choose your own password if you wish)   
e) Under Confirm your password Enter "dockeradmin"    (you can choose your own password if you wish)   
f) Select Done and Press Enter   

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/353df077-9842-4464-89d6-4f5f1b6cfa58)

**Step 30: Upgrade to Ubuntu Pro**

a) Add an X next to Skip for now   
b) Select continue  

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/0afccfee-281f-4378-a1b5-df18afe2302d)


**Step 29: SSH Setup**

a) Add an X next to Install OpenSSH Server   
b) Select Done and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2016.png?raw=true)

**Step 30: Feature Server Snaps**

a) Nothing to select in here, so select Done and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2017.png?raw=true)

**Step 31: Installing System**

a) Wait for installation to complete go to step 33

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2018.png?raw=true)

**Step 32: Installing System**

a) Once Installation is complete "Reboot Now" will appear under "View Full Log"
b) Select Reboot Now and Press Enter

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2019.png?raw=true)

**Step 34: Installation complete (Login)**

a) Login with the username and password created in step 29   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2020.png?raw=true)
![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2021.png?raw=true)

**Step 35: VM Login**

a) Login with the username and password created in step 29   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2020.png?raw=true)
![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/b774b639-4c4a-4b0f-9f16-b9b17c4243d1)


**Step 36: SSH to VM (Putty)**

a) Open Putty (Putty can be downloaded from within this repo)   
b) Enter "10.17.0.10" into Host Name , Saved Session and click Save   
c) Double Click 10.17.0.10 at reference Point 4 in screensheet.   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2026.png?raw=true)


**Step 37: SSH to VM (Login)**

a) At prompt enter login details that were created at step 29 and login.    When entering the password you will not see asterisks or characters appear.   

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/c38f0434-b9a7-4672-ad74-e2feae818bd3)


**Step 38: Install Docker**

a) Enter the following command into the putty screen and press enter. You should be able to copy and paste the following command (putty accept right mouse click for paste)
```
curl https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/main/windows_vbox/installation/docker-install.sh | bash
```
b) you will be ask for the password created at step 29. Please enter the password and press enter (asterisk or characters will not appear while entering the password)

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/b1ccc510-d4e6-4f79-ad4c-0004adb5e4e0)

**Step 39: Check Docker Installation is Complete**

a) enter at the prompt "docker ps" and press enter to conifrm docker is installed correctly.
b) You should see a similar response to the screenshot.

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2029.png?raw=true)

**Step 40: Set container passsword (this is the username to develop under)**

a) Type the following command to set a password for username container
```
sudo passwd container
```
b) enter a new password when the prompt appears (will not see any asterisks when typing a password)

![image](https://github.com/dbca-wa/docker-scripts-dev/assets/12062380/889eabc0-8ab1-4ff6-a31c-90599ee68097)

**Step 41: GIT Check out docker system run scripts**  

a) Run the follow command to pull a copy the dbca docker scripts:  (this should be run while in your home directory)   
```
git clone https://github.com/dbca-wa/docker-scripts-dev.git
```

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2030.png?raw=true)

**Step 42: GIT Check out docker system run scripts**   

a) Change Directory "cd docker-scripts-dev/windows_vbox"   
b) run command "mkdir env"   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2031.png?raw=true)

**Step 43: Start Postgres Server**  

a) Run "./postgres_docker_load.sh" (you might need to 'chmod 755 postgres_docker_load.sh' this file)   
b) Run "docker ps" to check the postgres container is running (see screenshot)   
c) Run "../tools/connect_postgres.sh" (this will allow you to connect into the container) - your prompt should change  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2032.png?raw=true)
![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2033.png?raw=true)

**Step 44: Start Postgres Server**   

a) Run "./create-new-postgres.sh" (This will create your postgres database inside the container,  never run this if you have a database setup as it will wipe your databases)  
b) Run "exit" So you can leave the container and go back to docker@dockerdev:~ prompt

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2034.png?raw=true)

**Completed**
