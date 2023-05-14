**Step 1. Install Docker**

a) Enter the following command into the linux terminal screen and press enter. You should be able to copy and paste the following command.
```
curl https://raw.githubusercontent.com/dbca-wa/docker-scripts-dev/main/linux/installation/docker-install.sh | bash
```

**Step 2. Setup SSH**

a) under the user account which you use ubuntu create an ssh key with the following command.  (if you already have an ssh key than you can skip this step) 
to check if you have and ssh key run the following account from your user account terminal

```
ls -al ~/.ssh/
```
You should see two files is_rsa and id_rsa.pub  if you dont see these two files than you will need to create some ssh keys

use the following command to generate an ssh key

```
ssh-keygen -t rsa -b 4096
```
