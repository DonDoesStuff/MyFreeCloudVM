#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to display menu and get user's choice
display_menu() {
  echo -e "${GREEN}Welcome to MyFreeCloudVM${NC}"
  echo
  echo -e "${YELLOW}Menu:${NC}"
  echo "1. Install/Boot"
  echo "2. Cancel"
  echo
  read -rp "Enter your choice: " choice
}

# Function to install and boot the VM
install_and_boot_vm() {
  # Update and install packages
  echo -e "${YELLOW}Updating and installing packages...${NC}"
  if ! sudo apt update; then
    echo -e "${RED}Failed to update packages. Exiting.${NC}"
    exit 1
  fi

  if ! sudo apt upgrade -y; then
    echo -e "${RED}Failed to upgrade packages. Exiting.${NC}"
    exit 1
  fi

  if ! sudo apt install -y qemu libvirt-daemon; then
    echo -e "${RED}Failed to install required packages. Exiting.${NC}"
    exit 1
  fi

  # Check if .devcontainer already exists
  if [ -f .devcontainer ]; then
    echo -e "${YELLOW}.devcontainer already exists. Skipping creation.${NC}"
  else
    # Creating the .devcontainer file
    cat >.devcontainer <<EOL
{
  "image": "mcr.microsoft.com/vscode/devcontainers/base:ubuntu",
  "hostRequirements": {
    "cpus": 4,
    "memory": "8gb",
    "storage": "32gb"
  }
}
EOL
  fi

  # Check if w10.qcow2 already exists
  if [ -f w10.qcow2 ]; then
    echo -e "${YELLOW}w10.qcow2 already exists. Skipping download.${NC}"
  else
    # Downloading the QCOW2 image
    echo -e "${YELLOW}Downloading w10.qcow2...${NC}"
    if ! wget -O w10.qcow2 https://bafybeifaqlg3wdaxc2avfngbbl6o3b5fbbn2ag4oa7ijdw5dpduuph6e7a.ipfs.w3s.link/ipfs/bafybeifaqlg3wdaxc2avfngbbl6o3b5fbbn2ag4oa7ijdw5dpduuph6e7a/Windows10%20tao.qcow2; then
      echo -e "${RED}Failed to download w10.qcow2. Exiting.${NC}"
      exit 1
    fi

    # Display warning message
    echo
    echo -e "${RED}IMPORTANT${NC}"
    echo
    echo -e "${GREEN}Please read the Readme.md file for instructions on what to do next.${NC}"
    echo
    echo -e "${RED}DO NOT RUN THE FILE AGAIN BEFORE READING!${NC}"
    exit 1
  fi

  # Run the qemu virtual machine in the background
  echo -e "${GREEN}QEMU has booted.${NC}"
  qemu-system-x86_64 -m 4G -cpu max -smp 4 -usbdevice tablet -drive file=w10.qcow2 -display vnc=:1 -vga vmware &
  # Download and extract ngrok
  curl -sSL https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz | tar -xz

  # Read the token from ngrok_key.txt
  token=$(cat ngrok_key.txt)

  # Run ngrok with the token and port 5901
  ./ngrok --authtoken "$token" tcp 5901
}

# Function to cancel the script
cancel_script() {
  echo -e "${RED}Script canceled.${NC}"
  exit 0
}

# Display menu
display_menu

# Process user's choice
case $choice in
  1)
    install_and_boot_vm
    ;;
  2)
    cancel_script
    ;;
  *)
    echo -e "${RED}Invalid choice. Exiting.${NC}"
    exit 1
    ;;
esac
