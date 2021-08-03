### to build, i.e. update jar
    docker -H "ssh://<server>" build . -t arma
### then stop, rm and run again
    docker -H "ssh://<server>" run -d --restart=unless-stopped --name arma \
        -p 2302-2306:2302-2306/udp -it -v arma_data:/data \
        -e PASS=<PW> -e PASS_RCON=<rcon> arma