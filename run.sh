#!/bin/bash
echo "Current user is : ${USER}"

#docker run --gpus all --rm -ti --ipc=host pytorch/pytorch:latest
#docker run --gpus '"device=0,1,2,3"' --rm \
# Please note that PyTorch uses shared memory to share data between processes,
# so if torch multiprocessing is used (e.g. for multithreaded data loaders) the
# default shared memory segment size that container runs with is not enough,
# and you should increase shared memory size either with --ipc=host
# or --shm-size command line options to nvidia-docker run.

#hostname=$1
echo "Need your input to define `hostname`"
read hostname
echo "Got it hostname=$hostname"


DOCKER_IMAGE="atlas:latest"

root_dir='/nfs/STG/SemanticDenseMapping/jiachenliu'
u=$(id -un)
g=$(id -gn)
echo $u $g
xhost +local:docker
docker run --gpus all --rm --ipc=host \
    -e HOSTNAME=${hostname} \
    -e ROOT_DIR=${root_dir} \
    -e DISPLAY\
    -u $u:$g \
    -v "/nfs:/nfs/" \
    -v "/nfs/home/$u:/home/$u" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -it $DOCKER_IMAGE /bin/bash
