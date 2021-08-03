### to build, i.e. update jar
    docker -H "ssh://<server>" build . -t terraria
### then stop, rm and run again
    docker -H "ssh://<server>" run -d --restart=unless-stopped --name terraria \
        -p 7777:7777 -it -v terraria_data:/root/.local/share/Terraria/Worlds/ terraria