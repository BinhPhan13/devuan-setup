#!/bin/bash
if ! [[ $EUID -eq 0 ]]; then
  echo "Must run as root!"
  exit 1
fi

apt purge -y wpasupplicant
apt install -y iwd resolvconf

echo "[General]
EnableNetworkConfiguration=true
[Network]
NameResolvingService=resolvconf
" > main.conf && mv main.conf /etc/iwd/

