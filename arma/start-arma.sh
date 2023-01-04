#!/usr/bin/bash
steamcmd/steamcmd.sh +login steam_username +force_install_dir /data/arma_ds +app_update 233780 +quit
cd arma_ds;./arma3server -name=Arma3_Server -config=server.cfg
