#!/bin/bash
sudo apt purge -y xdg-user-dirs
sudo apt install -y --no-install-recommends \
  xinit xserver-xorg elogind policykit-1 \
  xfce4-session xfwm4 xfce4-panel xfce4-terminal \
  xfce4-power-manager xfce4-notifyd gnome-icon-theme \
  pulseaudio xfce4-pulseaudio-plugin \
  ibus-unikey im-config ibus-gtk3

echo "#!/bin/bash
rm -rf ~/.dbus/
rm -rf ~/.cache/sessions/
rm -rf ~/.config/pulse/
rm -rf ~/.config/ibus/
" > clean

echo "#!/bin/bash
if [[ \$(tty) =~ /dev/tty* ]]; then
    clean && startxfce4
fi
" > xfce

chmod +111 clean xfce
mkdir -p $HOME/.local/bin/
mv clean xfce $HOME/.local/bin/

# IBUS autostart
mkdir -p $HOME/.config/autostart/
echo "[Desktop Entry]
Type=Application
Name=IBUS Input Method
Exec=ibus-daemon
" > $HOME/.config/autostart/IBUS.desktop

