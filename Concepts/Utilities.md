# 🛠️ Common Linux Utilities Explained

## 🔍 grep (Global Regular Expression Print)

- **What it means:**  
The name `grep` comes from the command used in the text editor ed: **g/re/p** which stands for *global / regular expression / print*. It means “search globally for a pattern and print the matching lines.”

- **What it does:**  
`grep` searches for text patterns (like words or phrases) inside files or input and shows you the matching lines.
The `-v` option means **invert match**

- **Simple example:**  
```bash
grep "apple" fruits.txt
```
This finds and prints all lines in fruits.txt that contain the word "apple".

- **Why it's useful:**
You can quickly search and filter text to find what you need.

## grep -q

- **What it means:**  
The `-q` option means **quiet** or **silent** mode.

- **What it does:**  
`grep -q` searches for the pattern but **does not output anything**. It only sets the exit status:
  - Exit status `0` means the pattern was found.  
  - Exit status `1` means the pattern was not found.

- **Simple example:**  
```bash
grep -q "apple" fruits.txt
```
This checks if "apple" is in fruits.txt without printing any result.

- **Why it's useful:**
Useful in scripts when you just want to check if a pattern exists without displaying the matching lines.

## 📊 awk 
- **What it means:**
awk is named after its creators — Alfred Aho, Peter Weinberger, and Brian Kernighan.

- **What it does:**
awk is a powerful text-processing tool. It reads text line by line, splits it into fields (columns), and lets you select, format, or change parts of the text based on patterns.

- **Simple example:**
```bash
awk '{print $1}' fruits.txt
```
This prints the first column (word) of each line from fruits.txt.

- **Why it's useful:**
Great for working with structured text like tables or logs where you want to extract or modify columns.

## awk END

- **What it means:**  
`END` is a special pattern in `awk` that runs after processing all input lines.

- **What it does:**  
Commands inside the `END` block execute once after all lines have been read, useful for summary or final output.

- **Simple example:**  
```bash
awk '{sum += $1} END {print "Total:", sum}' numbers.txt
```
This adds up the first column of all lines in numbers.txt and prints the total at the end.

- ***Why it's useful:***
Great for calculating totals, averages, or printing final results after processing data.

## 🖥️ lscpu

- **What it means:**  
`lscpu` stands for **List CPU**. It shows detailed information about your computer’s CPU architecture.

- **What it does:**  
When you run `lscpu`, it displays details like the number of CPUs, cores, threads, CPU model, speed, and more.

- **Simple example:**  
```bash
lscpu
```
This command outputs a summary of your CPU’s hardware info.

- **Why it's useful:**
It helps you quickly understand the processor specs of your system without digging through system files.

## 🧩 uname

- **What it means:**  
`uname` stands for **Unix Name**. It shows information about your operating system.

- **What it does:**  
Running `uname` prints details like the system name, kernel version, and machine hardware info.

- **Simple example:**  
```bash
uname -a
```
This command shows all available system information in one line (kernel name, version, hostname, etc.).

- **Why it's useful:**
It’s a quick way to check which OS and kernel your system is running.

## 🧮 nproc

- **What it means:**  
`nproc` stands for **number of processors**.

- **What it does:**  
It shows how many CPU cores or processing units are available on your system.

- **Simple example:**  
```bash
nproc
```
This command prints the number of CPU cores your system can use.

- **Why it's useful:**
Useful for scripts or programs that want to optimize performance by knowing how many processors are available.

## 🧠 free -m

- **What it means:**  
`free` shows memory usage, and the `-m` option displays the information in **megabytes**.

- **What it does:**  
It displays how much RAM and swap memory your system is using and how much is free.

- **Simple example:**  
```bash
free -m
```
This prints memory usage in megabytes, making it easier to read.

- **Why it's useful:**
Helps you quickly check your system’s memory status and troubleshoot performance issues.

## 💾 df

- **What it means:**  
`df` stands for **disk free**.

- **What it does:**  
It shows how much disk space is used and available on all mounted filesystems.

- **Simple example:**  
```bash
df
```
This lists disk usage in blocks (default size).

- **Why it's useful:**
Helps you check disk space quickly.

## df -BG
- **What it means:**
The -B option tells df to show sizes in blocks of a specified size, and G means gigabytes.

- **What it does:**
df -BG shows disk space usage with sizes rounded and labeled in gigabytes.

- **Simple example:**
```bash
df -BG
```
his lists disk usage in gigabytes, making it easier to read and understand.

- **Why it's useful:**
Useful for a clear, human-readable view of disk space in GB.

## 📈 top -bn1

- **What it means:**  
`top` is a command that shows real-time system processes.  
The options `-b` and `-n1` modify its behavior:
  - `-b` means **batch mode** (outputs data once instead of interactive mode).  
  - `-n1` means **show only one iteration** (just one snapshot).

- **What it does:**  
`top -bn1` prints a single snapshot of the current running processes and system resource usage in a non-interactive way.

- **Simple example:**  
```bash
top -bn1
```
This command outputs one snapshot of CPU, memory, and process info, then exits.

- **Why it's useful:**
Useful for scripts or logging when you want to capture system status once without opening the interactive top interface.

## 👥 who -b

- **What it means:**  
`who` shows who is logged into the system.  
The `-b` option means **boot time**.

- **What it does:**  
`who -b` displays the last time the system was rebooted (booted).

- **Simple example:**  
```bash
who -b
```
This prints the system’s last boot time.

- **Why it's useful:**
Great for quickly checking when the system was last restarted.

## 🌐 ss -t

- **What it means:**  
`ss` stands for **socket statistics**.  
The `-t` option tells it to show only **TCP** sockets.

- **What it does:**  
`ss -t` lists all current TCP network connections on your system.

- **Simple example:**  
```bash
ss -t
```
This command shows active TCP connections, including info like source/destination IP and port.

- **Why it's useful:**
Helpful when you want to focus on TCP connections for monitoring or troubleshooting network issues.

## 🗂️ lsblk

- **What it means:**  
`lsblk` stands for **list block devices**.

- **What it does:**  
It shows information about all available block devices (like hard drives, SSDs, USB drives) and their partitions in a tree-like format.

- **Simple example:**  
```bash
lsblk
```
This command lists disks and their partitions, showing sizes, types, and mount points.

- **Why it's useful:**
Great for understanding your system’s storage layout and mounted drives.

## 🔢 wc -l and wc -w

- **What it means:**  
`wc` stands for **word count**.  
- `-l` counts **lines**.  
- `-w` counts **words**.

- **What it does:**  
- `wc -l` counts how many lines are in a file or input.  
- `wc -w` counts how many words are in a file or input.

- **Simple examples:**  
```bash
wc -l file.txt
```
Counts the number of lines in file.txt.
```bash
wc -w file.txt
```
Counts the number of words in file.txt.

- **Why it's useful:**
Quickly check the size of text by lines or words, useful in scripts or data analysis.

## 📜 journalctl _COMM=sudo

- **What it means:**  
`journalctl` is a command to view system logs managed by `systemd`.  
`_COMM=sudo` filters logs to show only entries where the command (`COMM`) is `sudo`.

- **What it does:**  
`journalctl _COMM=sudo` shows log entries related to the `sudo` command, like when users run commands with elevated privileges.

- **Simple example:**  
```bash
journalctl _COMM=sudo
```
This command displays all logs generated by sudo.

- **Why it's useful:**
Great for auditing or troubleshooting to see who used sudo and what commands were run.

## 📢 wall

- **What it means:**  
`wall` stands for **write all**.

- **What it does:**  
It sends a message to **all logged-in users** on the system by displaying the message on their terminals.

- **Simple example:**  
```bash
echo "System maintenance in 5 minutes" | wall
```
This sends the message "System maintenance in 5 minutes" to every user currently logged in.

- **Why it's useful:**
Great for broadcasting important announcements or alerts to all users at once.

## 📦 apt

- **What it means:**  
`apt` stands for **Advanced Package Tool**.

- **What it does:**  
`apt` is a command-line tool used on Debian-based systems to **install**, **update**, and **remove** software packages.

- **Simple examples:**
```bash
sudo apt update         # Refreshes the list of available packages
sudo apt install nginx  # Installs the nginx web server
sudo apt remove nginx   # Uninstalls nginx
```
- **Why it's useful:**
apt simplifies software management by handling dependencies and pulling packages from trusted repositories.

- **Where it's used:**
Debian, Ubuntu, Linux Mint, and other Debian-based systems.

## 🆚 Difference: apt vs aptitude
- **apt:**

- Default package manager on Debian-based systems.
- Lightweight, fast, and widely used in scripts and terminals.
- Comes pre-installed in most systems.

- **aptitude:**
- A more advanced, interactive package manager.
- Can be used in text-based GUI mode or via command line.
- Better at resolving complex dependencies automatically.
- Not installed by default — must be installed manually:
```bash
sudo apt install aptitude
```
- **When to use which?**
- Use apt for everyday tasks — it's simple and quick.
- Use aptitude if you're dealing with tricky dependency issues or prefer a menu-style interface in the terminal.

## 🔐 AppArmor

- **What it means:**  
**AppArmor** stands for **Application Armor**.

- **What it does:**  
AppArmor is a Linux **security module** that controls what programs can do by enforcing **per-application access rules**. It uses profiles to restrict how a program can interact with files, networks, and other system resources.

- **Simple example:**
AppArmor can restrict a web server so it:
- Can read `/var/www/`
- Cannot access `/home/user/` or `/etc/shadow`

- **Why it's useful:**  
Even if a program is exploited, AppArmor can **limit the damage** it can do. It's a form of **mandatory access control (MAC)**, adding another layer of security on top of traditional file permissions.

- **Where it's used:**  
- Commonly used in **Ubuntu**, **Debian**, and **openSUSE**.
- Helps protect services like `nginx`, `mysql`, `snap`, and more.

- **Commands to manage AppArmor:**
```bash
sudo aa-status         # Show AppArmor status
sudo aa-enforce profile_name   # Enforce a specific profile
sudo aa-disable profile_name   # Disable a specific profile
```
## ⏰ cron

- **What it means:**  
`cron` comes from the Greek word *chronos*, meaning **time**.  
It’s a built-in Linux service used to **schedule tasks** to run automatically at specific times or intervals.

- **What it does:**  
`cron` runs background jobs (called **cron jobs**) on a fixed schedule—like every day at midnight, every 5 minutes, or once a week.

- **Where it's configured:**  
Cron jobs are defined in a special file called a **crontab** (cron table).

- **Edit your user’s crontab:**
```bash
crontab -e
```
View your current scheduled jobs:
```bash
crontab -l
```
- **🧠 Cron Syntax:**
A cron job uses 5 time fields followed by the command:
```bash
*  *  *  *  *  command-to-run
│  │  │  │  │
│  │  │  │  └── Day of the week (0-7, Sunday=0 or 7)
│  │  │  └───── Month (1-12)
│  │  └──────── Day of the month (1-31)
│  └─────────── Hour (0-23)
└────────────── Minute (0-59)
```
- **📅 Example jobs:**
```bash
0 3 * * * /usr/bin/backup.sh
# Runs every day at 3:00 AM

*/10 * * * * /usr/bin/check_status.sh
# Runs every 10 minutes

0 0 * * 0 /usr/bin/cleanup.sh
# Runs every Sunday at midnight
```
- **Why it's useful:**
Automates tasks like backups, updates, monitoring scripts, and system maintenance — so you don’t have to remember to run them manually.
