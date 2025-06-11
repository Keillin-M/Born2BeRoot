## 🧱 LVM (Logical Volume Manager)

- **What it means:**  
**LVM** stands for **Logical Volume Manager**.

- **What it does:**  
LVM is a tool that lets you manage disk space more **flexibly**. Instead of using physical disks and partitions directly, you create **logical volumes** that are easier to resize and move.

- **Why it's useful:**
- Resize volumes without rebooting.
- Combine multiple physical disks into one virtual volume.
- Create snapshots for backups or testing.
- Simplify disk management, especially for servers or large storage systems.

- **Basic terms:**
| Term | Meaning |
|------|---------|
| **PV (Physical Volume)** | Actual hard disk or partition |
| **VG (Volume Group)**    | Pool of one or more physical volumes |
| **LV (Logical Volume)**  | The "virtual partition" you format and mount |

- **Simple workflow example:**
```bash
# Create a physical volume
sudo pvcreate /dev/sdb

# Create a volume group
sudo vgcreate my_vg /dev/sdb

# Create a logical volume (10G in size)
sudo lvcreate -L 10G -n my_lv my_vg

# Format and mount it
sudo mkfs.ext4 /dev/my_vg/my_lv
sudo mount /dev/my_vg/my_lv /mnt
```
- **Why it's powerful:**
With LVM, you can expand, shrink, or snapshot volumes on the fly, which is super handy for dynamic environments or servers.
