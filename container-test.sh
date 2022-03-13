#!/bin/sh
docker pull $REPO:${GITHUB_SHA::8}
if [ "$( docker container inspect -f '{{.State.Status}}' $container_name )" == "running" ]
then
    echo "container is running"
else
    docker rm -f $container_name
fi

docker run -d -p 8081:8080 --name=$container_name $REPO:${GITHUB_SHA::8}

if [ $(curl -sL -w "%{http_code}" "http:localhost:8081" -o /dev/null) = 200 ]; 
then
    echo "Application is running succesfuly"
else
    echo "Applcation not running"
fi

