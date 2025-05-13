#!/bin/bash

# Принудительно задаем настройки локали
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8

# Настройка VNC-пароля (автоматически, без подтверждения)
echo -e "yourpassword\nn\n" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Создаем конфиг Xfce для VNC
mkdir -p ~/.vnc
echo "#!/bin/sh
exec /bin/sh /etc/xdg/xfce4/xinitrc" > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

# Запускаем VNC-сервер
vncserver -kill :1 >/dev/null 2>&1 || true
vncserver :1 -geometry 1280x800 -depth 24

# Запускаем noVNC
websockify --web /usr/share/novnc/ 6080 localhost:5901 &
