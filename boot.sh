#!/bin/bash
echo Note:
echo This script requires some setup. Make sure you read the Readme.md!
# update and install packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y qemu-kvm libvirt-daemon qemu-system-x86_64
# download megadown
sudo apt-get -y install megadown
# download the mega file using megadown
./megadown 'https://mega.nz/file/Kl5HlSTD#P6WNrDQrypvHOARnnxdw426SXl2qsBHXWKLaFBcf28M'
# rename the downloaded file to w10.qcow2
mv 'Windows10 tao.qcow2' w10.qcow2
# run the qemu virtual machine in the background
qemu-system-x86_64 -m 4G -cpu max -smp 4 -usbdevice tablet -drive file=w10.qcow2 -display vnc=:1 -vga vmware &
# download and extract ngrok
curl https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz | tar -xz
# read the token from ngrok_key.txt
token=$(cat ngrok_key.txt)
# run ngrok with the token and port 5901
./ngrok --authtoken $token tcp 5901
