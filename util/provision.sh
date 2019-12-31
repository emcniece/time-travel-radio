#!/bin/bash
# Desiged to run on a Raspberry Pi 4B
# Run this as the user that will be running the scripts. Needs sudo.

set -e

# 0. Set locale
sudo locale-gen --purge en_CA.UTF-8
echo -e 'LANG="en_CA.UTF-8"\nLANGUAGE="en_CA:en"\n' | sudo tee -a /etc/default/locale

# 1. Install pip

# X. Install spidev
git clone https://github.com/doceme/py-spidev.git
pushd py-spidev
sudo python setup.py install
popd

# 2. Install NVM
if command -v nvm; then
  echo "NVM is already installed."
else
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm install 13
  node -v
fi


# 3. Install PM2
if which pm2; then
  echo "PM2 is already installed."
else
  echo "Installing PM2..."
  npm install -g pm2
fi

