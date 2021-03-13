# на директории хоста создаём директорию в которой разместим данные зеркала
mkdir mirror_data
cd mirror_data
# на директории хоста устанавливаем docker сервер для запуска контейнеров
sudo apt install docker docker.io
# запускаем docker сервер 
systemctl enable docker
systemctl start docker
sudo groupadd docker
docker pull ubuntu:18.04
docker run -t -i -v $(pwd):/home ubuntu:18.04 /bin/bash
# shellcheck disable=SC2164
cd /home
apt update && apt upgrade
apt install wget
apt install cron
apt install nano
echo wget --mirror -p --convert-links -P ./mirror https://www.chiark.greenend.org.uk/~sgtatham/bugs-ru.html > wget_mirror.sh
chmod +x ./wget_mirror.sh
sh ./wget_mirror.sh
exit
docker commit -m "Added wget, cron, nano and setted it" -a "Dmitriy Muravskiy" 6c5b3d49ca26 dima/statmirror
docker run -t -i -v $(pwd):/home dima/statmirror /bin/bash

docker build -t muravskyds/dima/statmirror git@github.com:Dmurav/static-mirror.git

docker tag local-image:tagname new-repo:tagname
docker push new-repo:tagname