+++
title = "Robotics assignment notes"
draft = true
+++

Four cases:

 * Gazebo
 * Robot
 * Kerbals
 * Phone

A (robot OR phone) assignment may be required, but purchasing a robot kit will
not be explicitly required and the course will focus on simulation.


## HW01 - Obstacle Avoidance in Gazebo

The students will be given a Gazebo environment and asked to write a program
that gets the robot from the starting point to a goal point.

 - The robot has LIDAR
 - The robot has perfect x, y, theta localization sense
 - Obstacles are convex and sparse - this is pure obstacle avoidance.
 - Control program initially just drives robot forward - robot isn't even facing
   the right direction.
 - To submit: Control program, video of control program running

Goals:

 - Get Gazebo installed and working.
 - Successfully write a control program.
 - Basic obstacle avoidance mechanics
 - Successfully record a demo video.

## HW02 - Launch a Rocket

Students will be asked to write a KOS script to launch a rocket to 100km orbit.

 - They can build the rocket, but should be at least two stages.
 - Launch strategy not explicitly specified.
 - Launch Delta-V cost should be better than a bad manual gravity turn.
 - Final apoapsis and periapsis should be 100km +- 5km.
 - KOS terminal should be open, should print student's name when launch succeeds.
 - To submit: Launch script, video of launch.

Goals:

 - Get KSP installed and working.
 - Get KOS and Kerbal Engineer Redux mods installed.
 - Write a KOS script
 - Basic launch mechanics
 - Record a demo video
