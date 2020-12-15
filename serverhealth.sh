#!/bin/bash

#By Brian Hartford
#CIS245
#Server health script

log_date=$(date +'%m-%d-%Y')
echo $log_date

if [ -d "/home/LinuxHealth/" ]
then
	echo " Logs from this script can be found in /home/LinuxHealth"
else
	mkdir /home/LinuxHealth/
	echo "Logs from this script can be found in /home/LinuxHealth"
fi


#Create timestamped log file and directory to store it in.

filepathvar="/home/LinuxHealth/log-"$log_date".log"
echo 

#Create logifle
touch $filepathvar

{
#Searching in a directory where statistics are kept
echo Searching memory statistics
echo "__________________________________________________________________________"

cat /proc/meminfo
echo
echo "__________________________________________________________________________"
echo 
echo Searching process tree
echo
echo "___________________________________________________________________________"
echo
#Searches processes and the processes they originate from. The -h flag is to highlight current processes. 
pstree -h
echo
echo "____________________________________________________________________________"
echo 
#Listening for TCP packets on the network interface card, the c flag is the count of packets it will capture.
echo Running TCP dump
echo
echo "________________________________________________________________________________"
tcpdump -c 20
echo
echo
#Displaying some uptime statistics for users, including current cpu load
echo Displaying uptime
echo
echo "_______________________________________________________________________________"
echo
echo
uptime
echo
echo "_________________________________________________________________________________"
echo
echo "Displaying diskactivity with iostat, the -h flag is to make it human readable"
echo
echo "__________________________________________________________________________________"
iostat -h



} > $filepathvar


