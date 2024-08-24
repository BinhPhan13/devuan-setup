#!/bin/bash
sudo apt install -y file man htop powertop acpi bash-completion

grep -q "powertop --auto-tune" /etc/rc.local ||
sudo sh -c "echo powertop --auto-tune >> /etc/rc.local"

