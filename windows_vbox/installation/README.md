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

**Step 7: Create New VM Hard disk physical type**

a) Select Dynamically Allocated
b) Click Next   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_new_docker_storage_type2_vm.png?raw=true)


**Step 8: Select Storage Size**

a) Choose approximately 60GB
b) Click Create   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_new_docker_storage_size_vm.png?raw=true)


**Step 9: VM Settings**

a) Select the New VM Created from the left panel   
b) Click Settings from the top bar.   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_vm_settings.png?raw=true)

**Step 10: VM CPU Processor**

a) Select System   
b) Select Processor   
c) Change Processor from 1 to 2 (You can change this more if required)   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_system_processor.png?raw=true)

**Step 11: VM Acceleration**

a) Select System   
b) Select Acceleration   
c) Change Paravirtualization Interface to "KVM"  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_system_acceleration.png?raw=true)


**Step 12: VM Storage Settings**

a) Select Storage   
b) Select Ubuntu 22.04 (docker).vdi
c) Check Solid State Drive 

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_storage_controller_sata.png?raw=true)


**Step 13: VM Select Installation Media**

a) Select Storage   
b) Select Empty under Controller: IDE
c) Select Disk icon on the right and choose the download ubuntu 22.04-live-server image.
d) click ok

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_storage_controller_install_image.png?raw=true)

**Step 14: VM Start**

a) Select "Ubuntu 22.04 (docker)"
b) Click Start

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%201.png?raw=true)


# Download putty (inside this repo or latest version online or use windows Terminal)

# Install Docker
curl https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/main/windows_vbox/installation/docker-install.sh | bash

