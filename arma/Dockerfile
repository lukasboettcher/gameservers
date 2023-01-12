FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin LC_ALL=C

ENV USER arma
ENV HOME /data
ENV SERVER $HOME/arma_ds

RUN apt update && \
    apt install curl lib32gcc-s1 lib32stdc++6 locales -y

RUN locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup --gid 1000 arma \
    && adduser --system --shell /bin/false --uid 1000 --ingroup arma --home /data arma && \
    chown arma:arma -R /data

WORKDIR /data

USER $USER

# COPY --chown=1000:1000 runscript_arma /data/steamcmd/runscript_arma
COPY --chown=1000:1000 start-arma.sh /data/start-arma.sh
COPY --chown=1000:1000 *.cfg /data/arma_ds/garrysmod/cfg/

RUN mkdir -p /data/steamcmd
RUN echo 'passwordAdmin = "${PASS_RCON}"' >> /data/arma_ds/garrysmod/cfg/server.cfg
RUN echo 'password = "${PASS}"' >> /data/arma_ds/garrysmod/cfg/server.cfg
RUN sed -ie "s/steam_username/$STEAM_USER/g" /data/start-arma.sh

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -xzC /data/steamcmd

EXPOSE 2302-2306/udp

CMD [ "sh", "/data/start-arma.sh" ]
