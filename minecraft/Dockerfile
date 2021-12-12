FROM docker.io/openjdk:slim-buster

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install jq nano curl -y && \
    apt clean

RUN addgroup --gid 1000 minecraft \
    && adduser --system --shell /bin/false --uid 1000 --ingroup minecraft --home /data minecraft

EXPOSE 25565

COPY start.sh          /files/start.sh
COPY download-paper.sh /files/download-paper.sh
COPY server.properties /files/server.properties

# paper
#RUN sh /files/download-paper.sh

#vanilla
RUN curl --silent -o /files/server.jar $(curl --silent $(curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release as $latest | .versions[] | select(.id == $latest) | .url') | jq -r '.downloads.server.url')


USER 1000

# VOLUME ["/data"]

WORKDIR /data

RUN echo "eula=true" > eula.txt

CMD [ "sh", "/files/start.sh" ]
