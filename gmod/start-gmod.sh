#!/usr/bin/bash
steamcmd/steamcmd.sh +login anonymous +force_install_dir /data/gmod_ds +app_update 4020 +quit
steamcmd/steamcmd.sh +login anonymous +force_install_dir /data/css_ds +app_update 232330 +quit
steamcmd/steamcmd.sh +login anonymous +force_install_dir /data/tf2_ds +app_update 232250 +quit

sed -i -e 's#\./steam\.sh #\./steamcmd\.sh #g' gmod_ds/srcds_run # edit autoupdate for server version
gmod_ds/srcds_run -game garrysmod -console -usercon  -port 27015 -net_port_try 1 -maxplayers 24 \
        -autoupdate -steam_dir /data/steamcmd -steamcmd_script /data/steamcmd/runscript_gmod \
        +gamemode terrortown +map ttt_minecraft_b5 +host_workshop_collection 286987864 -authkey "${API}" \
        +rcon_password "${PASS_RCON}" +sv_password "${PASS}" +sv_setsteamaccount "${GSLT}"
