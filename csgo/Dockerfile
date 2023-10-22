FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin LC_ALL=C

ENV USER csgo

RUN apt update && \
    apt install curl lib32gcc-s1 \
    lib32stdc++6 net-tools locales -y

RUN ln -s /data/persistent/steamcmd/linux64/steamclient.so /usr/lib/x86_64-linux-gnu/steamclient.so

RUN locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup --gid 10001 $USER \
    && adduser --system --shell /bin/false --uid 10000 --ingroup $USER --home /data $USER && \
    mkdir -p /data/persistent/steamcmd && chown $USER:$USER -R /data

USER $USER

WORKDIR /data

COPY --chown=$USER:$USER start-server.sh /data/start-server.sh
COPY --chown=$USER:$USER *.cfg /data/cfgs/

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -xzC /data/persistent/steamcmd
RUN /data/persistent/steamcmd/steamcmd.sh +quit \
    && ln -s /data/persistent/steamcmd/linux32/steamclient.so /data/persistent/steamcmd/steamservice.so \
    && mkdir -p /data/.steam/sdk32 \
    && ln -s /data/persistent/steamcmd/linux32/steamclient.so /data/.steam/sdk32/steamclient.so \
    && ln -s /data/persistent/steamcmd/linux32/steamcmd /data/persistent/steamcmd/linux32/steam \
    && mkdir -p /data/.steam/sdk64 \
    && ln -s /data/persistent/steamcmd/linux64/steamclient.so /data/.steam/sdk64/steamclient.so \
    && ln -s /data/persistent/steamcmd/linux64/steamcmd /data/persistent/steamcmd/linux64/steam \
    && ln -s /data/persistent/steamcmd/steamcmd.sh /data/persistent/steamcmd/steam.sh

EXPOSE 27015/tcp
EXPOSE 27015/udp

CMD [ "bash", "/data/start-server.sh" ]
