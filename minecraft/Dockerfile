FROM openjdk:slim-buster

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install jq nano curl -y && \
    apt clean

RUN addgroup --gid 1000 minecraft \
    && adduser --system --shell /bin/false --uid 1000 --ingroup minecraft --home /data minecraft

EXPOSE 25565

USER 1000

# VOLUME ["/data"]

WORKDIR /data

RUN echo "eula=true" > eula.txt

COPY server.properties server.properties

# paper
RUN curl --silent -o server.jar https://papermc.io/api/v1/paper/$(curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release')/latest/download

#vanilla
#RUN curl --silent -o server.jar $(curl --silent $(curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release as $latest | .versions[] | select(.id == $latest) | .url') | jq -r '.downloads.server.url')

CMD [ "java", "-jar", "-Xms4G", "-Xmx4G", "server.jar" ]
