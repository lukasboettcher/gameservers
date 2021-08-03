FROM ubuntu:latest

COPY backup_script.sh /backup_script.sh

VOLUME [ "/backup" ]

ENTRYPOINT [ "bash", "/backup_script.sh" ]

CMD ["/data/"]
