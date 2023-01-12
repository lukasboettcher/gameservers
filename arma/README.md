### launch arma container
```
docker run -d --restart=unless-stopped --name arma \
    -p 2302-2306:2302-2306/udp -it -v arma_data:/data \
    -e PASS=<PW> -e PASS_RCON=<rcon> -e STEAM_USER=<steam username> \
    ghcr.io/lukasboettcher/gameservers/arma:master
```