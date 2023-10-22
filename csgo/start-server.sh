#!/usr/bin/bash
cat << EOF > $HOME/cfgs/steamcmd_runscript
force_install_dir /data/persistent/csds
login ${STEAMUSER} ${STEAMPASS}
app_update 730
quit
EOF

/data/persistent/steamcmd/steamcmd.sh +runscript $HOME/cfgs/steamcmd_runscript
cp $HOME/cfgs/*.cfg /data/persistent/csds/game/csgo/cfg/
/data/persistent/csds/game/bin/linuxsteamrt64/cs2 -dedicated +map de_dust2 -port 27015 -net_port_try 1 \
        -maxplayers_override 10 -tickrate 128 -secure -authkey "${API}" \
        -autoupdate -steam_dir /data/persistent/steamcmd -steamcmd_script $HOME/cfgs/steamcmd_runscript \
        +game_type 0 +game_mode 1 +host_workshop_collection 1332302394 +workshop_start_map 131866721 \
        +sv_setsteamaccount "${GSLT}" +log on +sv_allow_votes 0 +sv_logbans 1 +sv_logecho 1 +sv_logfile 1 +sv_log_onefile 1 \
        +sv_hibernate_when_empty 1 +sv_hibernate_ms 5 +sv_maxrate "0" +sv_minrate "128000" +sv_minupdaterate "128" \
        +sv_mincmdrate "128"  +sv_pure 1 +sv_pure_kick_clients 1 +sv_steamgroup 3318874 +sv_region 3 \
        +host_name_store 1 +host_info_show 1 +host_players_show 2 +hostname "EG CS:GO - Server" \
        +rcon_password "${PASS_RCON}" +sv_password "${PASS}" +sv_cheats 0 +sv_lan 0 +exec banned_user.cfg +exec banned_ip.cfg