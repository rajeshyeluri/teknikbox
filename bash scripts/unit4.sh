#!bin/bash
#prog: shell script to check file permissions
echo "Print file permission"
sudo ls -l /etc/shadow >> ~/Documents/unit4_work 
sudo ls -l /etc/gshadow >> ~/Documents/unit4_work
sudo ls -l /etc/group >> ~/Documents/unit4_work
sudo ls -l /etc/passwd >> ~/Documents/unit4_work

echo "create user accounts"

echo "check the user groups"

id sam >> ~/Documents/unit4_work
id joe >> ~/Documents/unit4_work
id sara >> ~/Documents/unit4_work
id amy >> ~/Documents/unit4_work
id admin >> ~/Documents/unit4_work

groups sam >> ~/Documents/unit4_work
groups joe >> ~/Documents/unit4_work
groups amy >> ~/Documents/unit4_work
groups sara >> ~/Documents/unit4_work
groups admin >> ~/Documents/unit4_work
#groups joe >> ~/Documents/unit4_work
#groups amy >> ~/Documents/unit4_work
#groups sara >> ~/Documents/unit4_work
#groups admin >> ~/Documents/unit4_work

echo "create engineers group"

#sudo delgroup engineers >> ~/Documents/unit4_work

#sudo addgroup engineers >> ~/Documents/unit4_work

#sudo usermod -G engineers joe >> ~/Documents/unit4_work
#sudo usermod -G engineers sam >> ~/Documents/unit4_work
#sudo usermod -G engineers sara >> ~/Documents/unit4_work
#sudo usermod -G engineers amy >> ~/Documents/unit4_work

groups joe >> ~/Documents/unit4_work
groups amy >> ~/Documents/unit4_work
groups sara >> ~/Documents/unit4_work
groups admin >> ~/Documents/unit4_work

# sudo mkdir -p /home/engineers

sudo chgrp -R engineers /home/engineers 
sudo chmod -R 2775 /home/engineers

#sudo apt install lynis

#man lynis









