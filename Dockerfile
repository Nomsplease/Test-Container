FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_FLUXBOX=yes

#Install Layer - Common
RUN dpkg --add-architecture i386 &&\
    apt update &&\
    apt install -y software-properties-common supervisor tzdata unzip curl wget net-tools lib32gcc-s1 procps crudini &&\
    apt clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Install Layer - X11 and VNC
RUN apt update &&\
    apt install -y xvfb x11vnc xterm fluxbox novnc &&\
    apt clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Copy local files
COPY root/ /

#Exposed Ports
## VNC
EXPOSE 8080

#Entrypoint to Setup services
ENTRYPOINT ["/entrypoint.sh"]