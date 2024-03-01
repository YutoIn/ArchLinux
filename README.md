# ArchLinux
ArchLinuxの構成を記述する。

注意：ArchLinux/bin/以下にあるシェルスクリプト群は既存のArchLinuxから新しくArchLinux環境を作成する際に利用することを想定している。

## ハードウェア
このシェルスクリプト群を実行するためのハードウェア要件
### CPU
- IntelのCPU必須
### GPU
- NvidiaのGPU必須
### RAM
- 32GB以上必要
### SSD
- 1TB以上必要
### BIOS
- UEFI対応

## ArchLinuxの構成
### Kernel
- stable
### BootLoader
- systemd-boot
### System Encryption
- LUKS
### File System
- Bcachefs
### Swap Management
- Zramd
### Backup and Restore
- Timeshift
### Virtual Console
- Kmscon
### Power Management
- ACPI
- TLP

### Virtualization
####   Virtualization Platform
- KVM/QEMU
#### Management Tool
- virt-manager
#### Containerization
- Docker
#### Container Orchestration
- Kubernetes
#### Virtual Disk Management
- libvirt
#### Networking
- Bridge Networking
####   DNS and DHCP Server
- dnsmasq
#### Virtual Distributed Ethernet
- vde2
#### UEFI Firmware
- edk2-ovmf

### Networking
#### Network Management
- NetworkManager
#### DNS
- bind
#### NTP
- chrony
#### Firewall
- firewalld
#### SSH
- OpenSSH
#### VPN
- OpenVPN
#### Wi-Fi
- wpa_supplicant
#### Bluetooth
- BlueZ
#### Zeroconf
- avahi
#### Printing System
- cups

### Desktop Environment
#### Desktop Environment
- KDE
#### Display Server
- Wayland
#### Display Manager
- SDDM

### Audio Configuration
#### Sound Server
- PulseAudio
#### Audio Output
- ALSA
#### Audio Player
- VLC

### Input Method
#### Input Method Framework
- fcitx5
#### Input Method Editor
- Mozc
 
  
