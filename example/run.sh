#!/bin/bash

dockerfile_name=Dockerfile
cont_name=helloworld
cont_image=helloworld
cont_net=helloworld-net

cont_id=$(sudo docker ps -a -q --filter ancestor=$cont_name)

if [ -z "$cont_id" ]
then
    echo 'Container is not exist'

else
    echo "[Removing] container ID - $cont_id"

    sudo docker stop $cont_id
    sudo docker rm $cont_id
    sudo docker rmi $cont_image
fi

echo '[Redeploying]'

sudo docker build --tag=$cont_image - < $dockerfile_name
sudo docker run -d --name $cont_name -p 8080:8080 --network=$cont_net $cont_image
clear
sudo docker ps