#!/usr/bin/bash
cp /srv/server.cfg /data/server.cfg
echo '' >> /data/server.cfg
echo '\npasswordAdmin = "${PASS_RCON}";' >> /data/server.cfg
echo 'password = "${PASS}";' >> /data/server.cfg
exec /data/DayZServer -config=/data/server.cfg -port=2302 -BEpath=battleye -profiles=profiles -dologs -adminlog -netlog -freezecheck
