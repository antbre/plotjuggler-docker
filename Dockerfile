# Build arguments
ARG ROS_DISTRO=noetic

FROM ros:${ROS_DISTRO}

# Restate the arg to make it available in later stage
ARG ROS_DISTRO

# to avoid debconf: unable to initialize frontend: Dialog
ENV DEBIAN_FRONTEND=noninteractive

# general library installations tools for development
# application libraries are brought in as package dependents
RUN apt-get update && apt-get install -y ros-${ROS_DISTRO}-plotjuggler \
                                         ros-${ROS_DISTRO}-plotjuggler-ros \
                   && rm -rf /var/lib/apt/lists/*

CMD ["rosrun", "plotjuggler", "plotjuggler"]   