# 🔐 What is UFW?
UFW (Uncomplicated Firewall) is a user-friendly frontend for managing iptables firewall rules on Linux. It provides an easy way to:

- Allow/block ports

- Restrict IP addresses

- Manage network traffic

Key features:
✅ Simple commands (no complex iptables syntax)
✅ Default deny policy (blocks all incoming traffic by default)
✅ IPv6 support

## 🛠️ UFW Basics
### 1. Enable/Disable UFW
| Command | Description |
|---------|-------------|
| `sudo ufw enable` | Activate firewall |
| `sudo ufw status` | List current rules |
| `sudo ufw reset` | Reset all rules |

### 2. Default Policies
```bash
sudo ufw default deny incoming  # Block all incoming traffic  
sudo ufw default allow outgoing # Allow all outgoing traffic
```
## 🔧 UFW Rules (Born2BeRoot Setup)
### 1. Allow SSH (Port 4242)
```bash
sudo ufw allow 4242/tcp  # Required for Born2BeRoot!
```
### 2. Delete a Rule
First list rules with numbers:
```bash
sudo ufw status numbered
```
Then delete by number (e.g., rule #1):
```bash
sudo ufw delete 1
```
### 3. Advanced Rules
| Rule | Command |
|------|---------|
| Allow SSH | `sudo ufw allow 4242/tcp` |
| Block IP | `sudo ufw deny from 192.168.1.50` |
| Rate-limit | `sudo ufw limit 22/tcp` |

## 📜 UFW in Born2BeRoot
### Requirements
Only port 4242 (SSH) should be open

Verify with:
```bash
sudo ufw status
```
Expected output:
```text
Status: active  
4242/tcp ALLOW Anywhere
```
### Troubleshooting

| Issue	| Solution |
|-------|----------|
| UFW blocks SSH	| `Check if port 4242 is allowed` |
|Rules not applying	| `Restart UFW: sudo ufw reload` |

💡 Pro Tips
- Always test SSH after enabling UFW!

- Use ufw status verbose for detailed info.

- For logging:
```bash
sudo ufw logging on  # Logs to /var/log/ufw.log
```
