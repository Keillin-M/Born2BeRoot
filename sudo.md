# What is `sudo`?

`sudo` (short for **"SuperUser DO"**) is a command in Linux and Unix-like operating systems (including Debian) that allows permitted users to execute commands with **administrative (root) privileges**. It provides a secure way to perform system-level tasks without logging in as the `root` user.

---

## Why Use `sudo`?
1. **Security**: Prevents accidental system damage by limiting root access.
2. **Auditability**: Logs all `sudo` commands (in `/var/log/auth.log`).
3. **Granular Control**: Admins can specify which users can run which commands.

---

## Basic Usage
```bash
sudo <command>
```
Example (update package lists):

```bash
sudo apt update
```
You’ll be prompted for your password the first time you use sudo in a session.

## Common sudo Commands
| Command               | Description                          |
|-----------------------|--------------------------------------|
| `sudo apt update`     | Refresh package lists.               |
| `sudo nano /etc/fstab`| Edit a system file.                  |
| `sudo reboot`         | Restart the system.                  |
| `sudo adduser bob`    | Add a new user.                      |
| `sudo visudo`         | Edit the `sudoers` file safely.      |

## sudo vs. su
| Command          | Behavior                              |
|------------------|---------------------------------------|
| `sudo command`   | Runs a **single command** as root.    |
| `su -`           | Switches to a **root shell** (requires root password). |

## Configuring sudo
Edit /etc/sudoers safely with:
```bash
sudo visudo
```
Example: Allow user bob full sudo access:
```text
bob ALL=(ALL:ALL) ALL
```

## Troubleshooting
| Issue                              | Solution                               |
|------------------------------------|----------------------------------------|
| *"User is not in the sudoers file"*| Run as root: `usermod -aG sudo username` |
| Disable password prompt (unsafe)   | Add to `/etc/sudoers`: `username ALL=(ALL) NOPASSWD:ALL` |

## Key Notes
- Always verify commands run with sudo (they can modify the system).

- Use sudo -i for a root shell (exit with Ctrl+D or exit).
