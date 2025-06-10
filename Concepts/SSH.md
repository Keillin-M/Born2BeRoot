# 🔐 What is SSH?
SSH (Secure Shell) is a cryptographic network protocol for:

- Secure remote access to servers (like your Debian VM)

- Encrypted data transfer (protects against eavesdropping)

- Alternative to insecure protocols like Telnet

Key features:
✅ Encrypts all communication
✅ Uses public-key authentication (more secure than passwords)
✅ Supports port forwarding

## 🛠️ How SSH Works
Basic Connection
```bash
ssh username@server_ip -p port_number
```
Authentication Methods
| Method          | How It Works                              |
|-----------------|------------------------------------------|
| **Password**    | Uses username/password (less secure)     |
| **SSH Keys**    | Uses cryptographic key pairs (recommended) |

## 🔧 SSH Configuration (Born2BeRoot)
### 1. Key Files
| File                        | Purpose                                |
|-----------------------------|----------------------------------------|
| `/etc/ssh/sshd_config`      | Server configuration                   |
| `~/.ssh/authorized_keys`    | Stores client public keys              |

### 2. Hardening SSH
Edit /etc/ssh/sshd_config:
```ini
Port 4242                  # Change default port (22 → 4242)
PermitRootLogin no         # Disable root login  
PasswordAuthentication yes # Allow password auth (required for 42)
```
Restart SSH:
```bash
sudo systemctl restart sshd
```
## 🔑 SSH Key Setup (Bonus)
### 1. Generate Key Pair
On your local machine:
```bash
ssh-keygen -t ed25519
```
(Stores keys in ~/.ssh/id_ed25519 (private) and ~/.ssh/id_ed25519.pub (public))

### 2. Copy Key to VM
```bash
ssh-copy-id -p 4242 user@localhost
```
Now you can log in without a password.

## 🚨 Security Best Practices
- Always use SSH instead of Telnet/FTP

- Disable root login (PermitRootLogin no)

- Use key-based auth (more secure than passwords)

- Change default port (reduces brute-force attacks)

## 📜 SSH in Born2BeRoot
- Requirement: SSH must run on port 4242

- Firewall: UFW must allow this port:
```bash
sudo ufw allow 4242/tcp
```
- Test: Verify connection works:
```bash
ssh -p 4242 user@localhost
```
## 💡 Troubleshooting
| Issue                 | Solution                              |
|-----------------------|---------------------------------------|
| **Connection refused**| Check `sudo systemctl status ssh`     |
| **Wrong port**        | Verify firewall: `sudo ufw status`    |
| **Permission denied** | Confirm username/key in `~/.ssh/authorized_keys` |  
