# 🔐 What is TTY Mode?
A TTY (short for Teletype) is a text-based terminal interface. In SSH, TTY mode:

- Forces an interactive terminal session (like typing commands manually)

- Prevents non-interactive exploits (e.g., automated attacks)

- Required for commands like sudo to prompt for passwords

# 🛡️ Why Enable TTY for SSH?

| Security Risk	| How TTY Mode Helps |
|---------------|--------------------|
| Brute-force attacks |	`Forces attackers to handle interactive prompts` |
| Automated scripts	| `Blocks non-interactive sessions (common in bots)` |
| Privilege escalation	| `Ensures sudo password prompts appear` |

# ⚙️ How to Enable TTY in SSH
## 1. Server-Side (/etc/ssh/sshd_config)
Add this line to enforce TTY for SSH sessions:
```ini
PermitTTY yes
```
Then restart SSH:
```bash
sudo systemctl restart sshd
```
## 2. Client-Side (When Connecting)
Use -t flag to request a TTY:
```bash
ssh -t -p 4242 user@localhost
```
# 📜 Born2BeRoot Requirement
- You must enable TTY for SSH connections (part of security hardening)
- Verify it works:
```bash
# Try to run sudo via SSH without TTY (should fail):
ssh -p 4242 user@localhost "sudo ls"
# With TTY (should prompt for password):
ssh -t -p 4242 user@localhost "sudo ls"
```
## 💡 Key Notes
- TTY mode slows down automated attacks (bots can't easily handle interactive prompts)

- Required for sudo password prompts to work over SSH

- Disabling TTY (PermitTTY no) is a security risk (allows silent command execution)

## Summary
| Term       | Purpose                          | Born2BeRoot Rule           |
|------------|----------------------------------|----------------------------|
| **TTY**    | Forces interactive terminal      | Must be enabled in SSH     |
| **Non-TTY**| Allows silent command execution  | Blocked for security       |
