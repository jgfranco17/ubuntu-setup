#!/bin/bash
echo "Preparing to install dev apps..."
sudo apt update && sudo apt upgrade

# GNOME Tweaks
sudo add-apt-repository universe
sudo apt install gnome-tweaks
echo "Set up GNOME Tweaks"

# VS Code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
echo "Installed VS Code"

# Jetbrains Toolbox
sudo apt-get install -y libfuse2
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash
echo "Installed Jetbrains Toolbox"

# Vtop GUI
sudo npm install -g vtop
echo "Installed vtop"

# Hashicorp suite
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install nomad
sudo apt-get install consul
sudo apt-get install vault
sudo apt-get install packer
sudo apt-get install terraform
echo "Installed Hashicorp suite"
