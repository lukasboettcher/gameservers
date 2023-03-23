FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin LC_ALL=C

ENV USER gmod

RUN apt update && \
    apt install curl lib32gcc-s1 lib32stdc++6 lib32tinfo6 locales -y

RUN locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup --gid 1000 $USER \
    && adduser --system --shell /bin/false --uid 1000 --ingroup $USER --home /data $USER && \
    mkdir -p /data/persistent/steamcmd && chown 1000:1000 -R /data

WORKDIR /data

USER $USER

COPY --chown=1000:1000 start-server.sh /data/start-server.sh
COPY --chown=1000:1000 *.cfg /data/cfgs/
COPY --chown=1000:1000 steamcmd_runscript /data/cfgs/

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -xzC /data/persistent/steamcmd

EXPOSE 27015/tcp
EXPOSE 27015/udp

CMD [ "sh", "/data/start-server.sh" ]
