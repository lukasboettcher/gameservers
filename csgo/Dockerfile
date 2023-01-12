FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin LC_ALL=C

ENV USER csgo
ENV HOME /data
ENV SERVER $HOME/csgo_ds

RUN apt update && \
    apt install curl lib32gcc-s1 net-tools locales -y

RUN locale-gen en_US.UTF-8 \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup --gid 1000 csgo \
    && adduser --system --shell /bin/false --uid 1000 --ingroup csgo --home /data csgo && \
    chown csgo:csgo -R /data

WORKDIR /data

USER $USER

COPY --chown=1000:1000 runscript_csgo /data/steamcmd/runscript_csgo
COPY --chown=1000:1000 start-csgo.sh /data/start-csgo.sh
COPY --chown=1000:1000 *.cfg /data/csgo_ds/csgo/cfg/

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -xzC /data/steamcmd

EXPOSE 27015/tcp
EXPOSE 27015/udp

CMD [ "bash", "/data/start-csgo.sh" ]
