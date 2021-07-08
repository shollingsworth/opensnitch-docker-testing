FROM archlinux:latest

RUN pacman -Sy
RUN pacman -S --noconfirm vim
RUN pacman -S --noconfirm \
        git \
        go \
        python-setuptools

RUN pacman -S --noconfirm \
        libnetfilter_queue \
        libpcap \
        python-grpcio \
        python-protobuf \
        python-pyinotify \
        python-slugify \
        python-pyqt5

RUN pacman -S --noconfirm \
        sudo \
        base-devel \
        x11vnc \
        supervisor \
        net-tools \
        xorg-xauth \
        xorg-server-xvfb \
        xfce4 \
        xterm \
        xorg-server \
        screen \
        qt5-tools

RUN pacman -S --noconfirm tigervnc

RUN groupadd sudo
RUN useradd -m --shell /bin/bash -G sudo docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
WORKDIR /home/docker

RUN git clone https://aur.archlinux.org/opensnitch-git.git
RUN git clone https://aur.archlinux.org/python-grpcio-tools.git

WORKDIR /home/docker/python-grpcio-tools
RUN makepkg -i --noconfirm
WORKDIR /home/docker/opensnitch-git
RUN makepkg -i --noconfirm
WORKDIR /home/docker

COPY src/entrypoint.sh /
COPY src/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/entrypoint.sh"]
