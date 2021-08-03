#!/usr/bin/bash

tar cavf /backup/backup-$(date -Im).tar.gz $@
chown 1000:1000 /backup/*