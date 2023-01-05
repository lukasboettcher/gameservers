FROM docker.io/openjdk:18-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 25565
WORKDIR /data

RUN apt update && apt install jq nano curl -y 
RUN useradd -ru 1000 minecraft && chown 1000:1000 /data
RUN curl -s -o /srv/server.jar $(curl -s $(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release as $latest | .versions[] | select(.id == $latest) | .url') | jq -r '.downloads.server.url')

COPY start.sh          /srv/start.sh
# COPY download-paper.sh /srv/download-paper.sh
COPY server.properties /srv/server.properties

USER 1000:1000

CMD [ "sh", "/srv/start.sh" ]
