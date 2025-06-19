# Prepare for Evaluation

## apt x Aptitude
`apt` (Advanced Package Tool) is used to install, update and remove software packages. It is simpler, faster, basic and comes installed by default on Ubuntu.
`Aptitude` is a more advanced interactive package manager that uses apt. It is better at resolving complex dependencies automatically and it is not installed by default.

## AppArmor (Application Armor)
Is a security module that controls programs by enforcing per-application access rule. It uses profiles to restrict how programs can interact with files, networks and other system resoures. It is installed by default on Debian.

## cron (time)
Schedule tasks to run automatically ar specific times or intervals.
crontab -e: edit
crontab -l: current jobs
* * * * * /path/to/task
*(minute) *(hour) *(day) *(month) *(day of the week)
ex: */10 * * * * /path/to/task (runs every 10 minutes)
    0 3 * * * /path/to/task (every day at 3 AM)

## Virtual Mahcine
It's an emulated computer system created using virtualization software. Allows you to run multiple operating systems on one physical machine, each with it's own CPU, memory, storage and operating system. 
Ex: Used to test programs in a safe environment or a programs that requeires a different operating system that you have installed in your physical machine.

## Debian
Is a free and open-source operating system based on the Linux kernel. It focuses on community involvement and is known for being flexible and user-friendly.

## Rocky
s a free and open-source enterprise-grade Linux distribution designed to be a downstream, binary-compatible replacement for CentOS. It focuses on stability, security, and long-term support, making it ideal for servers and production environments.

## sudo (SuperUser do)
Allows permitted users to execute commands with administrative (root) privileges. Provides a secure way to perform system-level without loggin in as the root user.

### Why use sudo?
- Security: prevents accidental system damage by limiting root access.
- Auditability: logs all sudo commands.
- Granular control: Admins can specify which users can run which commands.
ex: update packagesm edit system files (nano), restart, add user.

## UFW (Uncomplicated Firewall)
It is a friendly-user frontend for managing iptables firewall rules on Linus. Easy way to:
- Allow ports
- Restrict IP addresses
- Manage network traffic

## TTY (Teletype)
Text-based terminal interface - Mode in a SSH.

## SSH (Secure Shell)
Cryptographic network protocol.
- Secure remote access to servers
- Encrypted data transfer
Check SSH 4242 created: /etc/ssh/ssh_config
You should be able to connect to your VM through the Terminal
```bash
$ ssh (user)@localhost -p 8080 (or the Port you have)
```
## LVM (Logical Volume Manager)
Tool that lets you manage disk space more flexibly, instead of using physical disks and partitions directly.
Ex: grow, shrink and combine storage easily.

## Password rules
Check the password policy created.
/etc/pam.d/common-password

## sudo
Check sudo requirements created.
```bash
$ sudo visudo
```

## Script
Check script created.
/usr/local/bin/monitoring.sh

# Commands
```bash
$ lsblk → check partitions
$ sudo aa-status → AppArmor status
$ getent group (group name)
$ cat /etc/group → lists all groups
$ groups → lists all groups of the user
$ sudo service ssh status → SSH status
$ sudo ufw status → UFW status
$ which sudo → if sudo properly installed
$ sudo crontab -e → edit cron schedule (to stop cron, comment the rule using #, avoid using command cron stop)
$ head -n 2 /etc/os-release → check Debian and version
```
## Change password
```bash
$ passwd
$ sudo passwd
```
## Change hostname
```bash
$ sudo nano /etc/hostname
$ sudo reboot
```
## UFW
```bash
$ sudo ufw allow 8080
$ sudo ufw status
```
delete
```bash
$ sudo ufw status numbered
$ sudo ufw delete (number)
```
## Create user/group
```bash
$ sudo adduser (name)
$ sudo addgroup (group name)
$ sudo adduser (name) (group name)
```
delete
```bash
$ sudo userdel (user)
$ sudo groupdel (group name)
```
