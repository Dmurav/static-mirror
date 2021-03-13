FROM dima/statmirror
LABEL maintainer="muravskydmitry@yandex.ru"
# coздаём точку монтирования контейнера на хосте
#VOLUME /home/dima/Documents/DEVOPS/static_mirror/
# отсюда будет запускаться CMD со скриптом
WORKDIR /home
# создаём скрипт с командой для скачивания сайта
RUN echo wget --mirror -p --convert-links -P ./mirror https://www.chiark.greenend.org.uk/~sgtatham/bugs-ru.html > wget_mirror.sh
# выдаём скрипту права на исполнение
RUN chmod +x ./wget_mirror.sh
# запускаем скрипт
CMD sh ./wget_mirror.sh
