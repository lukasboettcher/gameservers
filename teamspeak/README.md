### then stop, rm and run again
    docker -H "ssh://<server>" run -d --restart=unless-stopped --name teamspeak \
        -p 9987:9987/udp -p 30033:30033 -it -v ts3_data:/var/ts3server/ \
        -e TS3SERVER_LICENSE=accept teamspeak