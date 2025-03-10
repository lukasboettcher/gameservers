### launch dayz container
```
export DAYZ_FOLDER=dayz_data
mkdir $DAYZ_FOLDER && docker run -it -v `pwd`/$DAYZ_FOLDER:/data steamcmd/steamcmd:latest +force_install_dir /data +login <user> +app_update 223350 +quit
docker run -d --restart=unless-stopped --name dayz \
    -p 2302-2306:2302-2306/udp -p 27016:27016/udp -it -v `pwd`/$DAYZ_FOLDER:/data \
    -e PASS=<PW> -e PASS_RCON=<rcon> \
    ghcr.io/lukasboettcher/gameservers/dayz:master
```