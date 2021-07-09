FROM archlinux:latest

RUN pacman -Sy
RUN pacman -S --noconfirm \
        base-devel \
        git \
        go \
        libnetfilter_queue \
        libpcap \
        net-tools \
        python-grpcio \
        python-protobuf \
        python-pyinotify \
        python-pyqt5 \
        python-setuptools \
        python-slugify \
        qt5-tools \
        screen \
        sudo \
        supervisor \
        tigervnc \
        vim \
        xfce4 \
        xorg-server \
        xorg-server-xvfb \
        xorg-xauth \
        xterm


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
