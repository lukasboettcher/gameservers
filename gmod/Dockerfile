FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ENV USER gmod
ENV HOME /data
ENV SERVER $HOME/gmod_ds

RUN apt update && \
    apt install curl lib32gcc1 lib32stdc++6 lib32tinfo6 locales -y

RUN locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup --gid 1000 gmod \
    && adduser --system --shell /bin/false --uid 1000 --ingroup gmod --home /data gmod && \
    chown gmod:gmod -R /data

WORKDIR /data

USER $USER

COPY --chown=1000:1000 runscript_gmod /data/steamcmd/runscript_gmod
COPY --chown=1000:1000 start-gmod.sh /data/start-gmod.sh
COPY --chown=1000:1000 *.cfg /data/gmod_ds/garrysmod/cfg/

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -xzC /data/steamcmd

EXPOSE 27015/tcp
EXPOSE 27015/udp

CMD [ "sh", "/data/start-gmod.sh" ]
