# на директории хоста создаём директорию в которой разместим данные зеркала
mkdir mirror_data
cd mirror_data
# на директории хоста устанавливаем docker сервер для запуска контейнеров
sudo apt install docker docker.io
# запускаем docker сервер 
systemctl enable docker
systemctl start docker
# добавляет docker в группу пользователей, что бы запускать без sudo
sudo groupadd docker

# создаём контейнер на основе ubuntu:18:04
docker pull ubuntu:18.04
# запускаем контейнер в интерактивном режиме с монтированием директории и переходим в нужную директорию
docker run -t -i -v $(pwd):/home ubuntu:18.04 /bin/bash
cd /home
# доустанавливаем необходимые пакеты
apt update && apt upgrade
apt install wget
apt install cron
# настраиваем расписание для запуска скрипта скачивания данных сайта
echo 'echo 45 3 * * 6 sh ./wget_mirror.sh' > /etc/cron.d/task
# выходим из контейнера
exit
# записываем новый образ
docker commit -m "Added wget, cron, nano and setted it" -a "Dmitriy Muravskiy" 6c5b3d49ca26 dima/statmirror
# заливаем на удалённый репозиторий dockerhub
docker push muravskyds/statmirror

# можем запустить новый контейнер
docker run -t -i -v $(pwd):/home statmirror /bin/bash
# можем построить образ на основе гитхаб проекта и разметить в докерхаб репозитории
docker build -t muravskyds/statmirror2 git@github.com:Dmurav/static-mirror.git
# на основе докерфайла из каталога
docker build -t statmirrorlast ~/Documents/DEVOPS/static_mirror/

# построить образ на основе докерфайла
docker build -t statmirror ~/Documents/DEVOPS/static_mirror/
# запуск контейнера в интерактивном режиме с последующим удалением
docker run --rm -t -i -v $(pwd):/home/mirror statmirror /bin/bash
# выполнение команды в контейнере
docker exec containerid "sh wget_mirror.sh"
# запуск работающего контейнера в интерактивном режиме
docker exec -it d9a313661091 bash
# запук контейнера из образа в фоновом режиме с монтированием директории к директории на хосте
docker run -d -v $(pwd):/home/mirror statmirror tail -f /dev/null
