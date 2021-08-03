## Docker image to run basic backups
#### before creating backups, create folder with right permissions (uid 1000)
    ssh <server> mkdir -p /home/lukas/backups

#### then build / run the backups
    docker -H ssh://<server> build . -t backup
    docker -H ssh://<server> run -v /home/lukas/backups:/backup -v <whatever>:/data backup
