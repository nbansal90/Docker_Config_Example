#!/bin/bash

#> See: Verify the version of ubuntu running in a Docker container,
#> at https://stackoverflow.com/questions/38003194/verify-the-version-of-ubuntu-running-in-a-docker-container;

#It's simple variables that are shell script friendly, so you can run

echo "------------------->"
echo "------------------->"
echo "----start building docker image ..."

DOCKER_TAG="atlas:latest"
echo "Will build docker container $DOCKER_TAG ..."


docker build --tag $DOCKER_TAG \
    --force-rm \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) \
    --build-arg USER_NAME=$(id -un) \
    --build-arg GROUP_NAME=$(id -gn) \
