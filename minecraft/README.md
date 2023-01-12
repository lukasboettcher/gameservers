### launch minecraft container
```
docker run -d --restart=unless-stopped --name minecraft \
    -p 25565:25565 -it -v `pwd`/mc_data:/data \
    ghcr.io/lukasboettcher/gameservers/minecraft:master
```