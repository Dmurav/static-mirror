FROM ubuntu:18.04
LABEL maintainer="muravskydmitry@yandex.ru"
# работаем в домашней директории
WORKDIR /home
# создаём скрипт с командой для скачивания сайта
RUN ["echo", "wget --mirror -p --convert-links -P ./mirror https://www.chiark.greenend.org.uk/~sgtatham/bugs-ru.html > wget_mirror.sh"]
# выдаём скрипту права на исполнение
RUN ["chmod +x", "./wget_mirror.sh"]

# запускаем скрипт
CMD ["sh", "./wget_mirror.sh"]

