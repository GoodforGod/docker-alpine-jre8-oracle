#!/bin/bash

DOCKERFILE=Dockerfile
CONT_NAME=helloworld
IMAGE_NAME=helloworld

CONT_ID=$(sudo docker ps -a -q --filter ancestor=$CONT_NAME)

if [ -z "$CONT_ID" ]
then
    echo 'Container is not exist'

else
    echo "[Removing] container with ID - $CONT_ID"

    sudo docker stop $CONT_ID
    sudo docker rm $CONT_ID
    sudo docker rmi $IMAGE_NAME
fi

echo '[Redeploying]'

sudo docker build --tag=$IMAGE_NAME - < $DOCKERFILE
sudo docker run -d --name $CONT_NAME -p 8080:8080 $IMAGE_NAME
sudo docker ps