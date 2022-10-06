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


**Step 15: VM Start**

a) Select "Ubuntu 22.04 (docker)"   
b) Click Start   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%201.png?raw=true)


**Step 16: VM Running**

a) Select (with aarow keys) "Try or Install Ubunutu Server    
b) Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%202.png?raw=true)

**Step 17: VM Language**

a) Select (with aarow keys) "English"   
b) Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%203.png?raw=true)

**Step 18: VM Update Installer**

a) Select "Update to the new installer" - May not get this option if you image is already the latest.  If so skip to next step   
b) Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%204.png?raw=true)

**Step 19: VM Key Board Layout**

a) Both Layout and Variant should be English (US)   
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%205.png?raw=true)

**Step 20: VM Install Type**

a) X should be selected on Ubuntu Server   
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%206.png?raw=true)

**Step 21: VM Network**

a) Should see at least one interface configuration   
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%207.png?raw=true)

**Step 22: VM Proxy**

a) Proxy Address should be empty   
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%208.png?raw=true)

**Step 23: VM Ubuntu Mirror Location**

a) Mirror address should be an au archive.   
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%209.png?raw=true)

**Step 24: VM Configure Storage**

a) X should match selection in screenshot    
b) Select Done and Press Enter  

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2010.png?raw=true)

**Step 25: VM Configure Storage Space**

a) In the screenshot where is says LVM volume group (make note of that numberm we will need it in the next step)   
b) Using the arrow keys select the number next to mounted at /   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2011.png?raw=true)

**Step 26: VM Configure Storage Space Amount**

a) In the size box enter the amount you wrote down in Step 25.   
b) Select Save and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2012.png?raw=true)

**Step 27: VM Configure Storage Complete**

a) Select Save and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2013.png?raw=true)


**Step 28: VM Configure Storage Confirm**

a) Select Continue and Press Enter      

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2014.png?raw=true)


**Step 29: VM Profile Setup**

a) Under Name Enter "Docker"   
b) Under Your server name Enter "Docker"   
c) Under Username Enter "docker"   
d) Under Choose a password Enter "docker"   (you can choose your own password if you wish)
e) Under Confirm your password Enter "docker"    (you can choose your own password if you wish)   
f) Select Done and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2015.png?raw=true)

**Step 30: SSH Setup**

a) Add an X next to Install OpenSSH Server   
b) Select Done and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2016.png?raw=true)

**Step 31: Feature Server Snaps**

a) Nothing to select in here, so select Done and Press Enter   

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2017.png?raw=true)

**Step 32: Installing System**

a) Wait for installation to complete go to step 33

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2018.png?raw=true)

**Step 33: Installing System**

a) Once Installation is complete "Reboot Now" will appear under "View Full Log"
b) Select Reboot Now and Press Enter

![alt text](https://github.com/dbca-wa/docker-scripts-dev/blob/main/windows_vbox/installation/images/vbox_start_ubuntu_installation_step%2019.png?raw=true)



# Download putty (inside this repo or latest version online or use windows Terminal)

# Install Docker
curl https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/main/windows_vbox/installation/docker-install.sh | bash

