+++
title = "Welcome: 04 Gazebo and HW01"
weight = 4
+++

## Gazebo

 - Physical robots can be inconvenient
 - Especially, they tend to be both expensive and fragile
 - This is really obvious with rockets, but it's also true for less dangerous
   robots like the Ranger.
 - Again, the solution is simulation.
 - To simulate wheeled robots, we'll be using Gazebo
 - Gazebo is an open source robot simulator that's commonly used in academia and
   sometimes used in industry.
 - It's normally used with the ROS software stack, but we're just going to use
   it directly.

## Demo and HW01

 - In HW01, you'll be setting up your computer to run Gazebo and then writing a
   simple control program for a simulated robot.
 - Gazebo supports running on Linux. Officially, they require a recent release
   of Ubuntu.
 - I'm running Debian Linux (very similar to Ubuntu) to develop the assignments.
 - The two supported configurations will be Debian 10 or Ubuntu 20.04 directly
   installed (e.g. dual boot) on your personal computer.
 - If you can get it to work some other way, that's fine, but if it doesn't the
   course staff can't help you with your unsupported setup.
 - Gazebo does OpenGL rendering, which is likely to break several common
   alternate setups (e.g. running in a normal VM).

## Show the solution code running.

 - Once you have Linux and Gazebo installed, you're ready for HW01.
 - Download the starter code from Inkfish.
 - Run Gazebo with ```./sim.sh```
 - Goal: Write a control program that drives the robot car from start to checkerboard.
 - Show the brain directory.
 - "Write a control program".
 - Run the solution brain program.
 - Sensors: Laser scanner, pose sensor.
 - Actuators: Turn wheels, steering.

## Submitting the Homework

 - Create a "brain-hw01" directory.
 - Edit the README, add a video (the HW01 solution video)
 - ```make clean```
 - Create a tarball
 - Submit on Inkfish

