xhost +local:root

docker run -it --rm \
        -e "DISPLAY=$DISPLAY" \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --device=/dev/dri:/dev/dri \
        plotjuggler

xhost -local:root