### launch csgo container
```
docker run -d --restart=unless-stopped --name csgo \
    -p 27015:27015/udp -p 27015:27015 -it -v csgo_data:/data/persistent \
    -e GSLT=<GSLTKEY> -e API=<APIKEY> -e PASS=<PW> -e PASS_RCON=<RCONPW> \
    ghcr.io/lukasboettcher/gameservers/csgo:master
```