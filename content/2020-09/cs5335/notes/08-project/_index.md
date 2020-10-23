+++
title = "Week 8: Project Info"
weight = 8
+++

# Project Intro

 - Review Project
 
## Slam Overview

Sensor data:

 - Plan A: GPS
 - Plan B: Dead reckoning with encoders, accelerometer, compass
 - Combine with: Kalman Filer, Particle Filter
 - Better: Add ranger data: LIDAR, SONAR
 - Others: Camera
 
Problem: Registration - where are we on the map?

 - Particle filter helps here too.
 - Rotation error *kills* us.

## KSP Project Ideas

 - Mining mission to Tylo
 - Land and take-off from Eve
 - Automatic same-parent body using search to find efficient single burn
   solutions that don't need to match inclination. (e.g. handle any of Kerbin to
   Moho, Mun to Minmus, Tylo to Bop, etc.)

## Pure-Sim Project Ideas

Alternate motion?

 - Flying robot: https://www.youtube.com/watch?v=nLlLEw_hiNc&list=PLx0tK3DMiHk6vBj-pfe1_bEE-JgsR8-sl
 - Legged robot

What to do?

 - Solve maze with SLAM
 - Destructive pathfinding (e.g. knock over walls)

## Physical Robot Project Ideas

Mapping and Navigation

 - Control program:
   - Bluetooth to a computer?
   - Tape a phone to the robot and connect with USB serial?
   - Fit the control program in the Arduino?
 - SLAM?

Simple Motion Control

 - Balancing + Climbing over Obstacles

Stuff to do with a cellphone

 - "Heel": Voice commands and camera to follow human.
 - QR Breadcrumbs:
   - Spin to find a QR code
   - Drive towards it to a fixed distance
   - Spin to find second QR code
   - Etc.
 - It's got a GPS, so outdoor waypoints.
