#!/bin/bash

# Get the system hostname
hostname=$(hostname)
echo "Hostname: $hostname"

# Get the kernel version
kernel=$(uname -r)
echo -e "Kernel version: \t\t$kernel"

# Get the system architecture
architecture=$(uname -m)
echo -e "System architecture: \t\t$architecture"

# Get the system uptime
uptime=$(uptime -p)
echo -e "System uptime: \t\t\t$uptime"

# Get the number of CPU cores
cores=$(nproc)
echo -e "Number of CPU cores: \t\t$cores"

# Get the total amount of memory
memory=$(free -h | grep Mem | awk '{print $2}')
echo -e "Total amount of memory: \t$memory"

# Get the system's host IP address
ip_address=$(hostname -I)
echo -e "Host IP address: \t\t$ip_address"

file_system=$(df -h)
echo -e "File System Disk Space Usage \n$file_system"
