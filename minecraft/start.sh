#!/bin/sh
# copy server / settings files
[ ! -e /data/server.properties ] && cp /srv/server.properties /data/server.properties
cp /srv/server.jar /data/server.jar

echo "eula=true" > eula.txt

# finally start the minecraft server
java -jar -Xms4G -Xmx4G server.jar
