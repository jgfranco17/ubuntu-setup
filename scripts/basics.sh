#!/bin/bash
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
sudo apt update && sudo apt upgrade
sudo apt install -y curl
sudo apt install build-essential

# Configure dev tools
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt install git
sudo apt-get update
sudo apt-get install terminator
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Browsers
GOOGLE_CHROME_DEB="google-chrome-stable_current_amd64.deb"
wget "https://dl.google.com/linux/direct/${GOOGLE_CHROME_DEB}"
sudo dpkg -i "${GOOGLE_CHROME_DEB}"
BRAVE_RELEASE_URL="https://brave-browser-apt-release.s3.brave.com"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg ${BRAVE_RELEASE_URL}/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] ${BRAVE_RELEASE_URL}/ stable main"| sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
