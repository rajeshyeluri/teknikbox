#!/bin/bash

#command to create multiple directories freemem, diskusage,openlist,freedisk in backups

#sudo mkdir -p ~/backups/{freemem,openlist,diskusage,freedisk,cpuuse}


#script to freemem, diskusage etc command to be run automatically using bash

#command to free mem
free -h > ~/backups/freemen/free_mem.txt

#command to diskuse 

du -h > ~/backups/diskuse/disk_usage.txt

#command to open list 
lsof > ~/backups/openlist/open_list.txt

#command to freedisk
df -h > ~/backups/freedisk/free_disk.txt

#command for cpu_usage tool

cpu_usage_tool > ~/backups/cpuuse/cpu_usage.txt

#verification : to do this we simply cat the created .txt files 

cat ~/backups/freemem/free_mem.txt >> ~/Documents/unit5_work

cat ~/backups/diskuse/disk_use.txt >> ~/Documents/unit5_work.txt>>

cat ~/backups/openlist/open_list.txt >> ~/Documents/unit5_work.txt

cat ~/backups/freedisk/free_disk.txt >> ~/Documents/unit5_work.txt

cat ~/backups/cpuuse/cpu_usage.txt >> ~/Documents/unit5_work.txt
