#!/usr/bin/env sh

DISK_PATH="${1:-/media/mydisk}"
DISK_LABEL="${2:-TOSHIBA}"
sudo mkdir $DISK_PATH
sudo chown pi:pi $DISK_PATH
sudo mount /dev/sda1 $DISK_PATH
UUID=$(sudo blkid | grep $DISK_LABEL | grep -o '"[^"]*"' | awk 'FNR == 3 {print}' | sed 's/\"//g')
sudo echo "UUID=$UUID $DISK_PATH ntfs defaults,auto,users,rw,nofail,umask=000 0 0" >> /etc/fstab

#Setting up MiniDLNA
sudo cp -a configs/minidlna /etc/minidlna.conf
sudo sed -i -e "s/<PATH_TO_MEDIA>/$DISK_PATH/g" /etc/minidlna.conf
