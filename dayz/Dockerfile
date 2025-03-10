FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin

RUN apt update && \
    apt install -y lib32gcc-s1

WORKDIR /data

COPY start-dayz.sh /srv/start-dayz.sh
COPY server.cfg /srv/server.cfg

EXPOSE 2301-2306/udp
EXPOSE 27016/udp

CMD [ "sh", "/srv/start-dayz.sh" ]
