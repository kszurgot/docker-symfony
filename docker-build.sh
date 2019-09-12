#!/bin/bash
echo 'Please insert server name:'
read SERVER_NAME
echo 'Please insert project name:'
read PROJECT
exec `sed -i "s/{project}/$PROJECT/g" ./docker/config/vhosts/sample.conf`
exec `cp ./docker/config/vhosts/sample.conf ./docker/config/vhosts/$SERVER_NAME.conf`
exec `sed -i "s/$PROJECT/{project}/g" ./docker/config/vhosts/sample.conf`
echo 'Virtual Host created'
echo `docker-compose build --build-arg USER=$USER --build-arg UID=$(id -u) --build-arg PROJECT=$PROJECT --build-arg SERVER_NAME=$SERVER_NAME`