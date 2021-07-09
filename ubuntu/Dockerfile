FROM ubuntu:20.04

# Force link so it doesn't prompt
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

RUN apt update
# opensnitch required
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
        git \
        golang \
        libnetfilter-queue-dev \
        libpcap-dev \
        protobuf-compiler \
        python3-pip \
        pyqt5-dev-tools \
        qttools5-dev-tools \
        qt5-default

# nice to have / X11 related
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
        net-tools \
        screen \
        sudo \
        supervisor \
        tigervnc-standalone-server \
        vim \
        xfce4 \
        xterm


RUN useradd -m --shell /bin/bash -G sudo docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
WORKDIR /home/docker

COPY src/entrypoint.sh /
COPY src/install_opensnitch.sh /
COPY src/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/entrypoint.sh"]
