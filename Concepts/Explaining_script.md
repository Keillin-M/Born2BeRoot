# 📝 Script

## IP x MAC
🌐 It’s a logical address assigned to a device on a network. Think of it like a postal address for sending data across the internet or a local network. IP addresses can change depending on the network you're connected to (like getting a new mailing address when you move).
🖥️ It’s a unique, physical hardware identifier assigned to a network interface card (NIC) by the manufacturer. Think of it as a device’s permanent serial number used for local network communication. Unlike IP, a MAC address generally doesn’t change.

## uname (Unix name)
Shows information about your operating system.
-a (all): shows all available system information.

## awk
Text procecessing tool that reads line by line and splits in columns and allows you to select, format or change parts of the text based on patterns.

### awk END
Special pattern that runf after processing all input lines.

## grep (Global Regular Expression Print)
Command that searches for a pattern and print the matching lines.
-v: inverts match
-q: quiet or silent mode (does not output) returns 0 if not found or 1 if found.

## lscpu (List CPU)
Shows information about computer's CPU architecture.

## nproc (Number of Processors)
Shows how many CPU cores are available.

## free
Shows memory usage.
-m: shows the information in MB

## df (disk free)
Shows how much disk space is used and available.
-B: blocks of specified size
-G: shows the information in GB

## top
Shows real time system process.
-b: batch mode
-n1: shows only one iteration

## who
Shows who is logged into the system.
-b: boot time (last time of reboot)

## ss (Socket Statistics)
Displays detailed information about network sockets.
Socket combines IP adresses (where the device is on the network) and Port number (what service is being accessed).
-t: only shows TCP sockets

## TCP (Transmission Control Protocol)
One of the core protocols of the internet that enables reliable, ordered and error-checked delivery data between devices on a network (like registered mail).

## lsblk (List block devices)
Shows information about all available block devices and their partitions in a tree like format.
Partition: logical division of a physical storage device

## wc (word count)
-l: lines
-w: words

## journalctl
Shows all system logs
_COMM=sudo: filters logs to show only entries where the command (COMM) is sudo

## wall (write all)
Whatever message you type or pass gets broadcasted to every user’s terminal session.

## RAM (Random Access Memory)
Used by the system to store data temporarily while programs are running.
