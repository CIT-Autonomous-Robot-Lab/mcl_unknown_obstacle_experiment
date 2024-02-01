cmake_minimum_required(VERSION 3.0.2)
project(mcl_unknown_obstacle_experiment)
find_package(catkin REQUIRED)

catkin_package(
  LIBRARIES ${PROJECT_NAME}
)

install(PROGRAMS
  scripts/publish_goal_tsudanuma.sh
  scripts/publish_goal_tsukuba.sh
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)