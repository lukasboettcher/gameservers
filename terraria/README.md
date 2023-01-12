### launch terraria container
```
docker run -d --restart=unless-stopped --name terraria \
    -p 7777:7777 -it -v terraria_data:/root/.local/share/Terraria/Worlds/ \
    ghcr.io/lukasboettcher/gameservers/terraria:master
```