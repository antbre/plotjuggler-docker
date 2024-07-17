xhost +local:root

# Check if the string is empty
if [ -z $1 ]; then
  echo "Please provide a path to the folder rosbags"
  exit 1
fi

# Remove the trailing slash if it exists
input_string="$1"
path="${input_string%/}"

docker run -it --rm \
        -e "DISPLAY=$DISPLAY" \
        -v $1/rosbags:/root/rosbags \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --device=/dev/dri:/dev/dri \
        plotjuggler

xhost -local:root