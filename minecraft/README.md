### to build, i.e. update jar
    docker -H "ssh://<server>" build . -t minecraft
### then stop, rm and run again
    docker -H "ssh://<server>" run -d --restart=unless-stopped --name minecraft -p 25565:25565 -it -v minecraft_data:/data minecraft