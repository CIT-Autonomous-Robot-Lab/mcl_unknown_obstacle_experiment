# mcl_unknown_obstacle_experiment [![Build](https://github.com/CIT-Autonomous-Robot-Lab/mcl_unknown_obstacle_experiment/actions/workflows/build.yaml/badge.svg)](https://github.com/CIT-Autonomous-Robot-Lab/mcl_unknown_obstacle_experiment/actions/workflows/build.yaml) [![Docker](https://github.com/CIT-Autonomous-Robot-Lab/mcl_unknown_obstacle_experiment/actions/workflows/docker.yaml/badge.svg)](https://github.com/CIT-Autonomous-Robot-Lab/mcl_unknown_obstacle_experiment/actions/workflows/docker.yaml)

観測範囲による未知障害物の対策を実装した[emcl2](https://github.com/CIT-Autonomous-Robot-Lab/emcl2/tree/feat/observation-range)を使用して、シミュレータ環境上で
動作させるためのパッケージ

# Install

```
docker run --rm -it \
           -u $(id -u):$(id -g) \
           --privileged \
           --net=host \
           --ipc=host \
           --env="DISPLAY=$DISPLAY" \
           --mount type=bind,source=/home/$USER/.ssh,target=/home/$USER/.ssh \
           --mount type=bind,source=/home/$USER/.gitconfig,target=/home/$USER/.gitconfig \
           --mount type=bind,source=/usr/share/zoneinfo/Asia/Tokyo,target=/etc/localtime \
           --name mcl-unknown-obstacle-experiment \
           ghcr.io/cit-autonomous-robot-lab/mcl_unknown_obstacle_experiment:melodic
```
# Launch file Description

* mcl_experiment.launch

| option                   | description                           |
| ------------------------ | ------------------------------------- |
| world_name               | シミュレータ環境の選択                |
| unknown_obstacle         | 未知障害物を配置するか                |
| handle_unknown_obstacles | 未知障害物対策有りのemcl2を実行するか |
| observation_range        | 観測範囲[deg]                         |

# Run

* 千葉工業大学 津田沼校舎シミュレータ（未知障害物有りの場合）
```
roslaunch mcl_unknown_obstacle_experiment mcl_experiment.launch \
  world_name:=tsudanuma \
  unknown_obstacle:=true \
  handle_unknown_obstacles:=true \
  observation_range:=30
```

* 千葉工業大学 津田沼校舎シミュレータ（未知障害物無しの場合）
```
roslaunch mcl_unknown_obstacle_experiment mcl_experiment.launch \
  world_name:=tsudanuma \
  unknown_obstacle:=false \
  handle_unknown_obstacles:=false
```

* つくば市役所前シミュレータ（未知障害物有りの場合）
```
roslaunch mcl_unknown_obstacle_experiment mcl_experiment.launch \
  world_name:=tsukuba \
  unknown_obstacle:=true \
  handle_unknown_obstacles:=true \
  observation_range:=20
```

* つくば市役所前シミュレータ（未知障害物無しの場合）
```
roslaunch mcl_unknown_obstacle_experiment mcl_experiment.launch \
  world_name:=tsukuba \
  unknown_obstacle:=false \
  handle_unknown_obstacles:=false
```

# Desktop PC specs used
* 12th Gen Intel® Core™ i9-12900K × 24
* GeForce RTX 2060

# License
Apache License, Version 2.0に基づいています。