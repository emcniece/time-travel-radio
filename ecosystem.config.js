// Minimal provisioning to be able to `git clone` this repo
// ToDo:
//   - Figure out how to git config:
//     git config --global user.nae "First Lastname"
//     git config --global user.email "user@example.com"
//   - usermod -a -G spi username

const provision = `which git || (sudo apt update && sudo apt install git)`

const branchName = require('current-git-branch');

module.exports = {
  apps : [{
    name: 'time-travel-radio-server',
    script: 'server/main.py',
    instances: 1,
    autorestart: true,

    // Watch files & reload
    watch: ['server', 'client'],
    watch_delay: 1000,
    ignore_watch : ["node_modules", "client/img"],
    watch_options: {
      "followSymlinks": false
    },

    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'development'
    },
    env_production: {
      NODE_ENV: 'production'
    }
  }],
  deploy : {
    dev : {
      user : 'emcniece',
      host : '192.168.1.119',
      ref  : `origin/${branchName}`,
      repo : 'https://github.com/emcniece/time-travel-radio.git',
      path : '/home/emcniece/time-travel-radio',
      'pre-setup'   : provision,
      'post-setup'  : './util/provision.sh',
      'ssh_options' : 'StrictHostKeyChecking=no',
      'post-deploy' : 'npm install && pm2 reload ecosystem.config.js --env production'
    }
  }
};
