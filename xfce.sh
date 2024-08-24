#!/bin/bash
sudo apt purge -y xdg-user-dirs
sudo apt install -y --no-install-recommends \
  xinit xserver-xorg elogind policykit-1 \
  xfce4-session xfwm4 xfce4-panel xfce4-terminal \
  xfce4-power-manager xfce4-notifyd gnome-icon-theme \
  pulseaudio xfce4-pulseaudio-plugin

echo "#!/bin/bash
rm -rf ~/.dbus/
rm -rf ~/.cache/sessions/
rm -rf ~/.config/pulse/
" > clean

echo "#!/bin/bash
if [[ $(tty) =~ /dev/tty* ]]; then
    clean && startxfce4
fi
" > xfce

chmod +111 clean xfce
mkdir -p $HOME/.local/bin/
mv clean xfce $HOME/.local/bin/

