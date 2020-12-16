# ServerHealth

This is a script to monitor server health, paying particular attention to memory, cpu load and processes. I have chosen to include the following commands in my script:

*cat /proc/meminfo*
This displays the contents of the meminfo file, which displays a number of stats about memory usage and allocation.

*pstree -h*
This shows the process tree with the current processes highlighted. This also shows where each process originated from.

*tcpdump -c 20*
This listens for TCP packet on the network interface card, the -c flag ends the search after 20 packets are captured*

*uptime*
This displays some info about how long the system has been up for, how many users are active and the average cpu load.

*iostat -h*
This displays some snapshots of disk activity in human readable format

This script is designed to be run as a cronjob with root permissions, otherwise it can be run with *sudo*. For ease of use I run it out of my home directory. The script checks if there is a directory to store the log file and if not, it creates one. Logfiles are created with a timestamp and the filepath leading to them */home/LinuxHealth* is sent to standard output for the user.

This script can be run remotely via ssh, and an scp command can be appended to the script to export teh log file to a remote machine.
example
*ssh [username]@[ipaddress]*
navigate to directory where script resides
append scp command to end of script
*scp [filepath to logfile] [username]@[ipaddress]:[directory where file will be stored] * 
run script
