#!/usr/bin/bash
steamcmd/steamcmd.sh +login $STEAM_USER +force_install_dir /data/dayz_ds +app_update 223350 +quit
cd dayz_ds;./DayZServer -config=server.cfg -port=2302 -BEpath=battleye -profiles=profiles -dologs -adminlog -netlog -freezecheck