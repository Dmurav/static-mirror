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
