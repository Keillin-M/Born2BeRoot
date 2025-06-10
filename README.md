# Born2BeRoot 💻

*A 42 School project to deploy a secure Debian server with strict system administration requirements*

---

## 📝 Mandatory Requirements
- **Partitioning**: LVM (Logical Volume Manager)
- **Security**:
  - SSH service on port **4242**
  - UFW firewall configured
  - Password policy enforcement
- **Monitoring**:
  - Custom script executing every 10 minutes via cron
- **User Management**:
  - Restricted sudo access
  - No direct root login

---

## 🛠️ Installation Guide

### 1. Download Debian
```bash
wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.x.x-amd64-netinst.iso
```
### 2. VM Configuration (VirtualBox)
Disk: 20GB (LVM)

RAM: 2GB

CPU: 2 cores

Network: NAT (port forward 4242 → 22)

### 3. LVM Partitioning
During installation:

- Select Manual partitioning

- Create:

  - /boot ext4 (500MB)

  - LVM volume group (remaining space)

  - Logical volumes for:

    - / (10GB)

    - /home (5GB)

    - swap (2GB)
---
## 🔒 Security Setup
Password Policy
```bash
sudo apt install libpam-pwquality
```
Edit /etc/security/pwquality.conf:
```ini
minlen = 10
difok = 7
maxrepeat = 3
```
SSH Hardening
Edit /etc/ssh/sshd_config:
```ini
Port 4242
PermitRootLogin no
PasswordAuthentication yes
```
UFW Firewall
```bash
sudo ufw allow 4242/tcp
sudo ufw enable
```
## 📊 Monitoring Script
Save as /usr/local/bin/monitoring.sh:
```bash
#!/bin/bash
echo "===== SYSTEM MONITOR ====="
echo "- Date: $(date)"
echo "- Uptime: $(uptime -p)"
echo "- Memory: $(free -m | awk 'NR==2{print $3}')MB used"
```
Make executable and add to cron:
```bash
sudo chmod +x /usr/local/bin/monitoring.sh
(crontab -l ; echo "*/10 * * * * /usr/local/bin/monitoring.sh") | crontab -
```
## ✅ Verification Checklist
Test SSH connection: ssh user@localhost -p 4242

- Verify password policy: sudo chage -l <user>

- Check LVM: sudo lvs

- Confirm firewall: sudo ufw status

## 📂 Project Structure
```bash
born2beroot/
├── configs/
│   ├── sshd_config
│   └── pwquality.conf
├── scripts/
│   └── monitoring.sh
└── README.md
```
💡 Pro Tip: Use sudo -l to verify your user's sudo privileges before submission!
