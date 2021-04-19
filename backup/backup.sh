#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
then
  echo "Please run as root or use sudo."
  exit
fi

BASE_DIR=/mnt/data/backup/$(hostname -s)
USER=brlav35

mkdir -p $BASE_DIR/home/$USER
rsync -aPh \
      --delete --delete-excluded \
      --exclude-from=backup-home.excludes.txt \
      /home/$USER/          $BASE_DIR/home/$USER

mkdir -p $BASE_DIR/etc/
rsync -aPh \
      --delete --delete-excluded \
      /etc/                 $BASE_DIR/etc/

mkdir -p $BASE_DIR/var/lib/libvirt
rsync -aPh \
      --delete --delete-excluded \
      /var/lib/libvirt/     $BASE_DIR/var/lib/libvirt/
