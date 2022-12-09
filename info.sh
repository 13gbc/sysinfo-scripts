#!/bin/bash

# Get the system hostname
hostname=$(hostname)
echo "Hostname: $hostname"

# Get the kernel version
kernel=$(uname -r)
echo "Kernel version: $kernel"

# Get the system architecture
architecture=$(uname -m)
echo "System architecture: $architecture"

# Get the system uptime
uptime=$(uptime -p)
echo "System uptime: $uptime"

# Get the number of CPU cores
cores=$(nproc)
echo "Number of CPU cores: $cores"

# Get the total amount of memory
memory=$(free -h | grep Mem | awk '{print $2}')
echo "Total amount of memory: $memory"

# Get the system's host IP address
ip_address=$(hostname -I)
echo "Host IP address: $ip_address"
