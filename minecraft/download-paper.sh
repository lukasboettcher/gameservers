# download latest paper jar
version=$(curl -s https://papermc.io/api/v2/projects/paper/ | jq -r '.versions[-1]')
build=$(curl -s https://papermc.io/api/v2/projects/paper/versions/$version | jq -r '.builds[-1]')
filename=$(curl -s https://papermc.io/api/v2/projects/paper/versions/$version/builds/$build | jq -r '.downloads.application.name')
curl -s -o /files/server.jar https://papermc.io/api/v2/projects/paper/versions/$version/builds/$build/downloads/$filename
