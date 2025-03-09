FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin LC_ALL=C

ENV USER dayz
ENV HOME /data
ENV SERVER $HOME/dayz_ds

RUN apt update && \
    apt install curl lib32gcc-s1 lib32stdc++6 locales -y

RUN locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup --gid 1000 dayz \
    && adduser --system --shell /bin/false --uid 1000 --ingroup dayz --home /data dayz && \
    chown dayz:dayz -R /data

WORKDIR /data

USER $USER

# COPY --chown=1000:1000 runscript_dayz /data/steamcmd/runscript_dayz
COPY --chown=1000:1000 start-dayz.sh /data/start-dayz.sh
COPY --chown=1000:1000 server.cfg /data/dayz_ds/server.cfg

RUN mkdir -p /data/steamcmd
RUN echo 'passwordAdmin = "${PASS_RCON}"' >> /data/dayz_ds/server.cfg
RUN echo 'password = "${PASS}"' >> /data/dayz_ds/server.cfg
RUN sed -ie "s/steam_username/$STEAM_USER/g" /data/start-dayz.sh

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -xzC /data/steamcmd

EXPOSE 2301-2306/udp

CMD [ "sh", "/data/start-dayz.sh" ]
