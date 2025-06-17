#!/bin/bash

# Architecture
arch=$(uname -a)

# CPU physical
pcpu=$(lscpu | grep "Socket" | awk '{print $2}')

# CPU virtual
vcpu=$(nproc)

# RAM:
ram_use=$(free -m | grep Mem | awk '{print $3}')
ram_total=$(free -m | grep Mem | awk '{print $2}')
ram_percent=$(free -m | grep Mem | awk '{printf("%.2f"), $3/$2 * 100}')

# Disk:
disk_total=$(df -BG | grep '^/dev/' | grep -v '/boot$' | awk '{disk_t += $2} END {print disk_t}')
disk_use=$(df -BG | grep '^/dev/' | grep -v '/boot$' | awk '{disk_u += $3} END {print disk_u}')
disk_percent=$(df -BG | grep '^/dev/' | grep -v '/boot$' | \
awk '{disk_u += $3} {disk_t += $2} END {printf("%d"), disk_u/disk_t*100}')

# CPU load
cpul=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# Last boot
lb=$(who -b | awk '{print $3 " " $4}')

# LVM use
lvmu=$(lsblk | grep -q "lvm" && echo "yes" || echo "no")

# TCP connections
ctcp=$(ss -t | grep ESTAB | wc -l)

# User log
ulog=$(users | wc -w)

# Network
ip=$(hostname -I | awk '{print $1}')
mac=$(ip link show | grep "ether" | awk '{print $2}')

# Sudo
cmnd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall "
#Architecture: $arch
#CPU physical: $pcpu
#vCPU : $vcpu
#Memory Usage: $ram_use/${ram_total}MB (${ram_percent}%)
#Disk Usage: $disk_use/${disk_total}Gb (${disk_percent}%)
#CPU load: ${cpul}%
#Last boot: $lb
#LVM use: $lvmu
#Connections TCP : $ctcp ESTABLISHED
#User log: $ulog
#Network: IP $ip ($mac)
#Sudo : $cmnd cmd"
