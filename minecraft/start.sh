# copy server / settings file
cp /files/server.properties /data/server.properties
cp /files/server.jar /data/server.jar

# finally start the minecraft server
java -jar -Xms4G -Xmx4G server.jar
