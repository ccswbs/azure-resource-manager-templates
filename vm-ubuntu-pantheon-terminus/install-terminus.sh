#!/bin/bash
sudo apt update
sudo apt -y install php-xml php-cli php-curl
curl -L https://github.com/pantheon-systems/terminus/releases/download/$(curl --silent "https://api.github.com/repos/pantheon-systems/terminus/releases/latest" | perl -nle'print $& while m{"tag_name": "\K.*?(?=")}g')/terminus.phar --output terminus
sudo install terminus /usr/local/bin
sudo -i -u wsadmin sh <<HERE
terminus auth:login --machine-token=$1
terminus ssh-key:list --field=id | xargs -n1 terminus ssh-key:remove
ssh-keygen -f ~wsadmin/.ssh/id_rsa -N ''
terminus ssh-key:add ~wsadmin/.ssh/id_rsa.pub
HERE
