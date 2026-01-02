### launch gmod container
```
docker run -d --restart=unless-stopped --name gmod \
    -p 27015:27015/udp -p 27015:27015 -it -v gmod_data:/data/persistent \
    -e GSLT=<GSLTKEY> -e WORKSHOP_COLL=286987864 -e PASS=<PW> -e PASS_RCON=<RCONPW> \
    ghcr.io/lukasboettcher/gameservers/gmod:master
```