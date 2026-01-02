#!/usr/bin/bash
/data/persistent/steamcmd/steamcmd.sh +force_install_dir /data/persistent/gmod_ds +login anonymous +app_update 4020 +quit
/data/persistent/steamcmd/steamcmd.sh +force_install_dir /data/persistent/css_ds +login anonymous +app_update 232330 +quit
/data/persistent/steamcmd/steamcmd.sh +force_install_dir /data/persistent/tf2_ds +login anonymous +app_update 232250 +quit

cp $HOME/cfgs/*.cfg /data/persistent/gmod_ds/garrysmod/cfg/
cp $HOME/cfgs/users.txt /data/persistent/gmod_ds/garrysmod/settings/users.txt
sed -i -e 's#\./steam\.sh #\./steamcmd\.sh #g' /data/persistent/gmod_ds/srcds_run # edit autoupdate for server version
/data/persistent/gmod_ds/srcds_run -game garrysmod -console -usercon  -port 27015 -net_port_try 1 -maxplayers 24 \
        -autoupdate -steam_dir /data/persistent/steamcmd -steamcmd_script $HOME/cfgs/steamcmd_runscript \
        +gamemode terrortown +map ttt_minecraft_b5 +host_workshop_collection "${WORKSHOP_COLL}" \
        +rcon_password "${PASS_RCON}" +sv_password "${PASS}" +sv_setsteamaccount "${GSLT}"
