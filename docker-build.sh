#!/bin/bash
echo 'Please insert server name:'
read SERVER_NAME
echo 'Please insert project name:'
read PROJECT
exec `sed -e "s/{project}/$PROJECT/g;s/{server}/$SERVER_NAME/g" ./docker/config/vhosts/sample.conf > ./docker/config/vhosts/$SERVER_NAME.conf`
echo 'Virtual Host created'
echo `docker-compose build --build-arg USER=$USER --build-arg UID=$(id -u) --build-arg PROJECT=$PROJECT --build-arg SERVER_NAME=$SERVER_NAME`
echo `docker-compose up -d`
echo `docker exec -it -u $USER webserver composer create-project symfony/skeleton $PROJECT`