**Step 1. Install Virtual Box**

https://www.virtualbox.org/wiki/Downloads

**Step 2: Setup Host Adapter**

Click File --> Host Network Manager

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_main_screen.png?raw=true)

a) Click Create and then Select the Adapter ending with #2.  
b) In the bottom box change the adapter IPV4 address to 10.17.0.1.   
c) Click Apply and Close.   

![alt text](https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/main/windows_vbox/installation/images/file__host_network_adapter.png)


**Step 3: Create New VM**

a) Click NEW Button

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_new_docker_vm.png?raw=true)

**Step 4: Create New VM Naming**

a) Enter under Name "Ubuntu 22.04 (docker)   
b) Drop down should match screenshot   
c) Click Next   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_new_docker_os_vm.png?raw=true)


**Step 5: Create New VM Memory**

a) Select 2048 of Memory (you can choose more if you wish)  
b) Click Next   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_new_docker_memory_vm.png?raw=true)

**Step 6: Create New VM Hard disk file type**

a) Select VDI (VirtualBox Disk Image)
b) Click Next   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_new_docker_storage_type_vm.png?raw=true)


# Download putty (inside this repo or latest version online or use windows Terminal)

# Install Docker
curl https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/main/windows_vbox/installation/docker-install.sh | bash

