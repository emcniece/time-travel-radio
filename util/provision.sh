#!/bin/bash
# Desiged to run on a Raspberry Pi 4B

set -e

# 1. Install pip

# 2. Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 13
node -v

# 3. Install PM2
npm install -g pm2
