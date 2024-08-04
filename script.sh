#!/bin/bash

# Параметры веб-сервера
server="nginx"
port=80

# Проверка доступности порта
nc -z -w5 $server $port
if [ $? -eq 0 ]; then
echo "Порт $port веб-сервера $server доступен"
else
echo "Порт $port веб-сервера $server недоступен"
exit 1
fi

# Проверка существования файла index.html
if curl --output /dev/null --silent --head --fail "http://$server/index.html"; then
echo "Файл index.html существует в root-директории веб-сервера $server"
else
echo "Файл index.html не существует в root-директории веб-сервера $server"
fi


