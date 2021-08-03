## Collection of GameServer docker images

#### general overview
    docker -H "ssh://server" ps
#### list volumes
    docker -H "ssh://server" volume ls
#### start container
    docker -H "ssh://server" start <id>
#### stop container
    docker -H "ssh://server" stop <id>
#### run a backup
    docker -H "ssh://server" run -v <volume>:/data -v $HOME/backups:backup backup