### launch dayz container
```
docker run -d --restart=unless-stopped --name dayz \
    -p 2302-2306:2302-2306/udp -it -v dayz_date:/data/dayz_ds \
    -e PASS=<PW> -e PASS_RCON=<rcon> -e STEAM_USER=<steam username> \
    ghcr.io/lukasboettcher/gameservers/dayz:master
```