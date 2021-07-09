#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

export DISPLAY=":0"
GEOMETRY=${GEOMETRY:-"1920x1080"}

#=============================================
# Setup vnc stuffs
#=============================================
mkdir -p ~/.vnc
cat <<EOF > ~/.vnc/xstartup
#!/bin/bash
startxfce4
EOF
echo "${VNC_PASSWORD}" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
chmod +x ~/.vnc/xstartup

#=============================================
# update opensnitch-git
#=============================================
/install_opensnitch.sh

#=============================================
# Start supervisor
#=============================================
sudo /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &

#=============================================
# run vncserver
#=============================================
touch ~/.Xauthority
tigervncserver :0 \
        -verbose \
        -depth 24 \
        -rfbwait 30000 \
        -PasswordFile ~/.vnc/passwd \
        -rfbport 5900 \
        -geometry "${GEOMETRY}" \
        -localhost no \
        -fg \
        -xstartup  ~/.vnc/xstartup
