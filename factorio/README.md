### launch a factorio server
```
docker run -d --restart=unless-stopped --name factorio \
  -p 34197:34197/udp -p 27015:27015/tcp \
  -e DLC_SPACE_AGE=false \
  -v `pwd`/factorio_data:/factorio \
  factoriotools/factorio:stable
```
