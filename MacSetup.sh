#!/bin/bash

#install necessary packages and tools
sudo apt-get update
sudo apt-get install build-essential get vim curl wget

#install Node.js and nmp
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

#install python and pip
sudo apt-get install -y python3 python3-pip

#install docker and docker compose
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# Set up Git configuration
git config --global user.name "Giuseppe"
git config --global user.email "giusdema99@gmail.com"

# Set up Vim configuration
echo "syntax on" > ~/.vimrc

# Print out completion message
echo "Development environment set up complete!"

