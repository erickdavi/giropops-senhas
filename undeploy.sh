#!/bin/bash

##CREATE CONTAINERS
docker container stop redis
docker container stop giropops-senhas
docker container rm redis
docker container rm giropops-senhas


##BUILD
docker image rm giropops-senhas

##CREATE NETWORK
docker network rm gironet

