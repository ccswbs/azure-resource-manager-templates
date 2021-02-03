#!/bin/bash
mkdir ~/terminus && cd ~/terminus
curl -L https://github.com/pantheon-systems/terminus/releases/download/$(curl --silent "https://api.github.com/repos/pantheon-systems/terminus/releases/latest" | perl -nle'print $& while m{"tag_name": "\K.*?(?=")}g')/terminus.phar --output terminus
chmod +x terminus
sudo ln -s ~/terminus/terminus /usr/local/bin/terminus
terminus auth:login --machine-token=$1
terminus ssh-key:list --field=id | xargs -n1 terminus ssh-key:remove
ssh-keygen -f ~wsadmin/.ssh/id_rsa -N ''
terminus ssh-key:add ~wsadmin/.ssh/id_rsa.pub
