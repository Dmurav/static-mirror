Назначение:
- Приложение формирует и обновляет статическое зеркало конкретного сайта

Основные команды управления:
- make sync - запускает обновление статического зеркала в директории хоста, на котором запущен контейнер
- make deploy - запускает установку и запуск скрипта с периодическим обновлением зеркала по субботам в 3:45

Приложение состоит из:
- проект на github https://github.com/Dmurav/static-mirror
- docker-image dima/statmirror на основе ubuntu 18.4 размещённый на https://hub.docker.com/

Компоненты github проекта:
- Makefile - содержит определение sync и deploy
- Dockerfile - содержит инструкции для развёртывания контейнера с настроенным скриптом
- README.md - описание проекта
- instructions.sh - все инструкции по развёртыванию проекта по порядку
- план_разработки.txt - план действий по созданию проекта
