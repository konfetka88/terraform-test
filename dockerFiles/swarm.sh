#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker
sudo systemctl enable docker
systemctl status docker

docker swarm join --token SWMTKN-1-5wgbprq5go2rvl4h53agxtwzfo4on1cgaauh4zmygc71uij9zz-c89wzo6c8f3cv606hfz6dlf6z 128.199.50.117:2377
docker info

docker service create \
--replicas=3 \
--publish mode=host,target=80,published=80 \
--name=wordpress \
--constraint=node.role==worker \
wordpress:php7.3

# Install 
docker service create    \
--replicas=3 \
--publish mode=host,target=6379,published=6379 \
--name=redis \
--constraint=node.role==worker \
redis


# Install Visualizer
docker service create    \
--constraint=node.role==manager    \
--mode=global \
--publish mode=host,target=8080,published=8080  \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
--name=visualizer \
dockersamples/visualizer