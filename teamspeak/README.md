### launch a teamspeak server
```
docker run -d --restart=unless-stopped --name teamspeak -p 9987:9987/udp \
    -p 30033:30033 -it -v `pwd`/ts3_data:/var/ts3server/ -e TS3SERVER_LICENSE=accept \
    -e TZ=Europe/Berlin -e LC_ALL=C teamspeak
```
