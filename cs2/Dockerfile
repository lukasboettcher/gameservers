FROM steamcmd/steamcmd

# ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin LC_ALL=C

# ENV USER csgo
# ENV HOME /data

# RUN apt update && \
#     apt install curl lib32gcc-s1 \
#     lib32stdc++6 net-tools locales -y

# RUN ln -s /data/persistent/steamcmd/linux64/steamclient.so /usr/lib/x86_64-linux-gnu/steamclient.so

# RUN locale-gen en_US.UTF-8 \
#     && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
#     && dpkg-reconfigure --frontend=noninteractive locales \
#     && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# RUN groupadd -g 10001 $USER \
#     && useradd -r -s /bin/false -u 10000 -g $USER -d /data $USER && \
#     mkdir -p /data/persistent/steamcmd && chown $USER:$USER -R /data

# RUN addgroup --gid 10001 $USER \
#     && adduser --shell /bin/false --uid 10000 --ingroup $USER $USER && \
#     mkdir -p /data/persistent/steamcmd && chown $USER:$USER -R $HOME

# USER $USER

# WORKDIR $HOME

# COPY --chown=$USER:$USER start-server.sh $HOME/start-server.sh
# COPY --chown=$USER:$USER *.cfg $HOME/cfgs/

# RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -xzC /data/persistent/steamcmd
# RUN /data/persistent/steamcmd/steamcmd.sh +quit \
#     && ln -s /data/persistent/steamcmd/linux32/steamclient.so /data/persistent/steamcmd/steamservice.so \
#     && mkdir -p /data/.steam/sdk32 \
#     && ln -s /data/persistent/steamcmd/linux32/steamclient.so /data/.steam/sdk32/steamclient.so \
#     && ln -s /data/persistent/steamcmd/linux32/steamcmd /data/persistent/steamcmd/linux32/steam \
#     && mkdir -p /data/.steam/sdk64 \
#     && ln -s /data/persistent/steamcmd/linux64/steamclient.so /data/.steam/sdk64/steamclient.so \
#     && ln -s /data/persistent/steamcmd/linux64/steamcmd /data/persistent/steamcmd/linux64/steam \
#     && ln -s /data/persistent/steamcmd/steamcmd.sh /data/persistent/steamcmd/steam.sh

# EXPOSE 27015/tcp
# EXPOSE 27015/udp
# ENTRYPOINT [ "bash", "-c" ]
# CMD [ "bash", "$HOME/start-server.sh" ]

COPY start-server.sh $HOME/start-server.sh
COPY *.cfg $HOME/cfgs/

ENTRYPOINT [ "bash", "-c" ]
CMD [ "$HOME/start-server.sh" ]