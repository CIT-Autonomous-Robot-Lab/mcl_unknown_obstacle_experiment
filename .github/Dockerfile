FROM osrf/ros:melodic-desktop-full

SHELL ["/bin/bash", "-c"]

ARG USERNAME="root"
ENV USER=$USERNAME
ENV USERNAME=$USERNAME
ENV GIT_PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w$(__git_ps1)\[\033[00m\](\t)\$ "
ENV NO_GIT_PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w \$ "
ENV ROS_MASTER_URI=http://localhost:11311
ENV ROS_HOSTNAME=localhost
ENV ROS_PYTHON_VERSION=3

RUN groupadd -g 1000 $USERNAME && \
    useradd -m -s /bin/bash -u 1000 -g 1000 -d /home/$USERNAME $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME

RUN apt update && apt upgrade -y && \
    apt install -y \
    bash-completion \
    curl \
    git \
    python3-catkin-tools \
    python3-pip \
    python3-vcstool \
    terminator \
    vim \
    wget \
    tree \
    ros-melodic-ddynamic-reconfigure \
    ros-melodic-navigation \
    ros-melodic-turtlebot3* \
    ros-melodic-twist-mux

USER $USERNAME
RUN mkdir /home/$USERNAME/catkin_ws/src -p && \
    curl -sL "https://raw.githubusercontent.com/CIT-Autonomous-Robot-Lab/mcl_unknown_obstacle_experiment/main/mcl_unknown_obstacle_experiment.repos" \
    -o /tmp/mcl_unknown_obstacle_experiment.repos && \
    vcs import /home/$USERNAME/catkin_ws/src < /tmp/mcl_unknown_obstacle_experiment.repos --debug --recursive && \
    source /opt/ros/melodic/setup.bash

RUN cd /home/$USERNAME/catkin_ws/src/lightsfm && \
    make && \
    sudo make install

RUN rm -rf /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_map2gazebo

RUN cd /home/$USERNAME/catkin_ws/ && \
    source /opt/ros/melodic/setup.bash && \
    catkin b && \
    : "remove cache" && \
    sudo apt-get autoremove -y -qq && \
    sudo rm -rf /var/lib/apt/lists/*

RUN bash /home/$USERNAME/catkin_ws/src/mcl_unknown_obstacle_experiment/scripts/code_fix.sh

RUN echo "source /home/$USERNAME/catkin_ws/devel/setup.bash" >> $HOME/.bashrc && \
    echo "source /etc/bash_completion" >> $HOME/.bashrc && \
    echo "if [ -f /etc/bash_completion.d/git-prompt ]; then" >> $HOME/.bashrc && \
    echo "    export PS1='${GIT_PS1}'" >> $HOME/.bashrc && \
    echo "else" >> $HOME/.bashrc && \
    echo "    export PS1='${NO_GIT_PS1}'" >> $HOME/.bashrc && \
    echo "fi" >> $HOME/.bashrc

WORKDIR /home/$USERNAME/catkin_ws/src/
