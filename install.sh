#!/usr/bin/env sh

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install ntfs-3g
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker pi
sudo apt-get install python3-pip -y
sudo apt-get install inotify-tools
sudo pip3 -v install docker-compose

# Installing minidlna as at the time of writing there isn't a way to run this via docker
sudo apt-get install minidlna -y

sudo hostname $1

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

