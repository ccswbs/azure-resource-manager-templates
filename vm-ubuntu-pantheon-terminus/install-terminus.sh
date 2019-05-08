#!/bin/bash
sudo apt-get update
sudo apt-get install -y composer php-xml zip
sudo mkdir /opt/terminus
cd /opt/terminus
sudo curl -O https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar
sudo php installer.phar install
sudo -u wsadmin terminus auth:login --machine-token=$1
sudo -u wsadmin ssh-keygen -f ~wsadmin/.ssh/id_rsa -N ''
sudo -u wsadmin terminus ssh-key:add ~wsadmin/.ssh/id_rsa.pub
