#!/bin/bash
# SPDX-FileCopyrightText: 2024 Tatsuhiro Ikebe <beike315@icloud.com>
# SPDX-License-Identifier: Apache-2.0

rostopic pub /move_base/goal move_base_msgs/MoveBaseActionGoal "header:
  seq: 0
  stamp:
    secs: 0
    nsecs: 0
  frame_id: ''
goal_id:
  stamp:
    secs: 0
    nsecs: 0
  id: ''
goal:
  target_pose:
    header:
      seq: 0
      stamp:
        secs: 0
        nsecs: 0
      frame_id: 'map'
    pose:
      position: 
        x: 52.3802833557
        y: 2.95863461494
        z: 0.0
      orientation: 
        x: 0.0
        y: 0.0
        z: -0.00192122625274
        w: 0.999998154443"
