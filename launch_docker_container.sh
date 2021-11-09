# Configurable variables.
image=hpcregistry.hpc.ford.com/gsandh16/cv_ubuntu18_cuda-10-0_cudnn7
port=6006
local_dir_map=/home/gsandh16

# Run the container.
xhost +local:
docker run  \
    --gpus all \
    --net=host \
    -p 6006:6006 \
    -p 8088:8088 \
    -it  \
    --rm  \
    --device=/dev/video0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix  \
    -v /s/mlsc:/s/mlsc \
    -e DISPLAY=$DISPLAY  \
        --env QT_X11_NO_MITSHM=1 \
    -v ${local_dir_map}:${local_dir_map} \
    ${image}

    # Uncomment if there is a need to map a second video device.
    #--device=/dev/video1 \

    # -p ${port}:${port} \
