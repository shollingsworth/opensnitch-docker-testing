#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

export DISPLAY=":0"
XFB_SCREEN=1920x1080

#=============================================
# Setup vnc stuffs
#=============================================
mkdir -p ~/.vnc
cat <<EOF > ~/.vnc/config
geometry=${XFB_SCREEN}
EOF
echo "${VNC_PASSWORD}" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

#=============================================
# Start supervisor
#=============================================
sudo /usr/sbin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &

#=============================================
# update opensnitch-git
#=============================================
pushd opensnitch-git
git reset --hard
git pull
makepkg -C -c -f -i --noconfirm
popd

#=============================================
# run vncserver
#=============================================
vncserver ${DISPLAY}
