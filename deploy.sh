#!/bin/bash

##BUILD
docker image build -t giropops-senhas:latest . || exit 1

##CREATE NETWORK
docker network create gironet

##CREATE CONTAINERS
docker container run -d --name redis -p 6379:6379 --network gironet redis:latest
docker container run -d -e "REDIS_HOST=redis" -p 5000:5000 --name giropops-senhas --network gironet giropops-senhas:latest
