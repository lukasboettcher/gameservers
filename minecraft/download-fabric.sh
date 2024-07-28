# download latest fabric jar

release=$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release')
loader=$(curl -s https://meta.fabricmc.net/v2/versions/loader/$release | jq '.[0].loader.version' | tr -d '"')
installer=$(curl -s https://meta.fabricmc.net/v2/versions/installer | jq '.[0].version' | tr -d '"')

curl -s -o /srv/server.jar https://meta.fabricmc.net/v2/versions/loader/$release/$loader/$installer/server/jar
mkdir /srv/mods
curl -s -o /srv/mods/lithium.jar $(curl -s https://api.modrinth.com/v2/project/lithium/version | jq --arg release "$release" 'first(.[] | select(.game_versions[] | contains($release)) | .files[].url)' | tr -d '"')
