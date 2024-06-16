#!/usr/bin/bash
steamcmd +runscript $HOME/cfgs/steamcmd_runscript.cfg
cp $HOME/cfgs/*.cfg /data/persistent/csds/game/csgo/cfg/
/data/persistent/csds/game/bin/linuxsteamrt64/cs2 -dedicated +map de_dust2 -port 27015 -net_port_try 1 \
        -maxplayers_override 10 -tickrate 128 -secure -authkey "${API}" -usercon \
        -autoupdate -steam_dir /root/.steam/steam/steamcmd -steamcmd_script $HOME/cfgs/steamcmd_runscript.cfg \
        +sv_setsteamaccount "${GSLT}" +rcon_password "${PASS_RCON}" +sv_password "${PASS}" \
        +log on +sv_allow_votes 0 +sv_logbans 1 +sv_logecho 1 +sv_logfile 1 +sv_log_onefile +hostname "EG CS Server" \
        +sv_pure 2 +exec banned_user.cfg +exec banned_ip.cf +game_type 0 +game_mode 1 