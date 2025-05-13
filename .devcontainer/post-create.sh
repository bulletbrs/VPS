#!/bin/bash

# Установка пароля VNC (замените 'yourpassword' на свой)
mkdir -p ~/.vnc
echo -e "yourpassword\nn\n" | vncpasswd > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Запуск VNC-сервера
vncserver :1 -geometry 1280x800 -depth 24

# Запуск noVNC
websockify --web /usr/share/novnc 6080 localhost:5901 &
