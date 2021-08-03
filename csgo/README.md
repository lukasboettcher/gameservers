### to build, i.e. update jar
    docker -H "ssh://<server>" build . -t csgo
### then stop, rm and run again
    docker -H "ssh://<server>" run -d --restart=unless-stopped --name csgo \
        -p 27015:27015/udp -p 27015:27015 -it -v csgo_data:/data \
        -e GSLT=<GSLT> -e API=<API> \
        -e PASS=<PW> -e PASS_RCON=<rcon> csgo