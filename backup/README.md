## Docker image to run basic backups
#### before creating backups, create folder with right permissions (uid 1000)
```
    ssh <server> mkdir -p $HOME/backups
```

#### then build / run the backups
```
    docker -H ssh://<server> run -v $HOME/backups:/backup \
    -v <whatever>:/data ghcr.io/lukasboettcher/gameservers/backup:master
```
