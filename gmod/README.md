### launch gmod container
```
docker run -d --restart=unless-stopped --name gmod \
    -p 27016:27015/udp -p 27016:27015 -it -v gmod_data:/data \
    -e GSLT=<GSLTKEY> -e API=<APIKEY> -e PASS=<PW> -e PASS_RCON=<RCONPW> \
    ghcr.io/lukasboettcher/gameservers/gmod:master
```