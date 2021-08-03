FROM alpine:latest as downloader

RUN apk add --update-cache \
    unzip curl jq

RUN curl -sLo terraria.zip https://terraria.org/api/download/pc-dedicated-server/terraria-server-1423.zip
RUN unzip -x terraria.zip -d /terraria && rm terraria.zip

FROM ubuntu:latest

WORKDIR /data

COPY --from=downloader --chown=1000:1000 /terraria/1423/Linux/ /data/terraria_ds

RUN chmod +x /data/terraria_ds/TerrariaServer.bin*

EXPOSE 7777

CMD [ "bash", "/data/terraria_ds/TerrariaServer" ]