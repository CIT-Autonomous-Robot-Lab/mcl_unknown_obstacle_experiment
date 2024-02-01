#!/bin/bash
# SPDX-FileCopyrightText: 2024 Tatsuhiro $USERNAME <beike315@icloud.com>
# SPDX-License-Identifier: Apache-2.0

# raspicat/raspicat_description/urdf/raspicat.urdf.xacro
sed -i '16s#.*#  <xacro:arg name="ultrasonic_visual"     default="false"/>#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_description/urdf/raspicat.urdf.xacro

sed -i '24s#.*#  <xacro:property name="lidar_mount_z" value="0.18"/>#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_description/urdf/raspicat.urdf.xacro

sed -i '25s#.*#  <xacro:property name="lidar_sensor_z" value="0.5"/>#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_description/urdf/raspicat.urdf.xacro

sed -i '69s#.*#    <origin xyz="-0.144 0 ${lidar_mount_z - 0.0262}" rpy="0 0 0"/>#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_description/urdf/raspicat.urdf.xacro

sed -i '120s#.*#      min_angle="-3.14" max_angle="3.14" min_range="0.01" max_range="60" visualize="$(arg laser_visual)"/>#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_description/urdf/raspicat.urdf.xacro

# raspicat/raspicat_description/urdf/sensors/lidar.gazebo.xacro
sed -i '9s#.*#        <update_rate>30</update_rate>#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_description/urdf/sensors/lidar.gazebo.xacro

sed -i '13s#.*#              <samples>360</samples>#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_description/urdf/sensors/lidar.gazebo.xacro

# raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/costmap_common_params.yaml
sed -i '8s#.*#  obstacle_range: 5#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/costmap_common_params.yaml

sed -i '9s#.*#  raytrace_range: 5#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/costmap_common_params.yaml

sed -i '21s#.*#    max_obstacle_height: 10.0#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/costmap_common_params.yaml

# raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/dwa_local_planner_params.yaml
sed -i '4s#.*#  max_vel_x: 0.5#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/dwa_local_planner_params.yaml

sed -i '11s#.*#  max_vel_x: 0.5#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/dwa_local_planner_params.yaml

# raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/global_costmap_params.yaml
sed -i '5s#.*#inflation_radius: 11.0#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/global_costmap_params.yaml

# /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/local_costmap_params.yaml
sed -i '5s#.*#inflation_radius: 2#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/local_costmap_params.yaml

sed -i '6s#.*#cost_scaling_factor: 1#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/local_costmap_params.yaml

sed -i '13s#.*#width: 2.5#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/local_costmap_params.yaml

sed -i '14s#.*#height: 2.5#' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/config/param/local_costmap_params.yaml

# raspicat/raspicat_navigation/raspicat_waypoint_navigation/launch/move_base.launch
sed -i '25s#.*##' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/launch/move_base.launch

sed -i '26s#.*##' \
    /home/$USERNAME/catkin_ws/src/raspicat/raspicat_navigation/raspicat_waypoint_navigation/launch/move_base.launch
