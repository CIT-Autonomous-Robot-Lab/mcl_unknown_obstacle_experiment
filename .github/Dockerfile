FROM osrf/ros:melodic-desktop-full

SHELL ["/bin/bash", "-c"]

ARG USERNAME="root"
ENV USER=$USERNAME
ENV USERNAME=$USERNAME
ENV GIT_PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w$(__git_ps1)\[\033[00m\](\t)\$ "
ENV NO_GIT_PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w \$ "
ENV ROS_MASTER_URI=http://localhost:11311
ENV ROS_HOSTNAME=localhost

RUN groupadd -g 1000 $USERNAME && \
    useradd -m -s /bin/bash -u 1000 -g 1000 -d /home/$USERNAME $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME

RUN apt update && apt upgrade -y && \
    apt install -y \
    bash-completion \
    git \
    terminator \
    vim \
    wget \
    python3-catkin-tools \
    python3-pip \
    python3-vcstool \

USER $USERNAME
RUN curl -sL "https://raw.githubusercontent.com/CIT-Autonomous-Robot-Lab/raspicat/master/raspicat_navigation.repos" \
  -o /tmp/mcl_unknown_obstacle_experiment.repos && \
    vcs import /home/$USERNAME/catkin_ws/src < /tmp/raspicat_navigation.repos --debug --recursive && \
    source /opt/ros/noetic/setup.bash && \
    rosdep update && \
    DEBIAN_FRONTEND=noninteractive rosdep install -r -y --from-paths --ignore-src ./

RUN cd /home/$USERNAME/catkin_ws/ && \
    source /opt/ros/noetic/setup.bash && \
    catkin b && \
    : "remove cache" && \
    sudo apt-get autoremove -y -qq && \
    sudo rm -rf /var/lib/apt/lists/*

RUN echo "setw -g mouse on" >> $HOME/.tmux.conf && \
    echo "source /home/$USERNAME/catkin_ws/devel/setup.bash" >> $HOME/.bashrc && \
    echo "source /etc/bash_completion" >> $HOME/.bashrc && \
    echo "if [ -f /etc/bash_completion.d/git-prompt ]; then" >> $HOME/.bashrc && \
    echo "    export PS1='${GIT_PS1}'" >> $HOME/.bashrc && \
    echo "else" >> $HOME/.bashrc && \
    echo "    export PS1='${NO_GIT_PS1}'" >> $HOME/.bashrc && \
    echo "fi" >> $HOME/.bashrc

WORKDIR /home/$USERNAME/src/