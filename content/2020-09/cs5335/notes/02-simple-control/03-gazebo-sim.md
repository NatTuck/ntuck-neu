+++
title = "Gazebo Sim"
weight = 3
+++


# Topic: Quick Overview of the HW01 Starter Code

To simulate a robot, you want two pieces:

 - The Gazebo simulation
 - The control program

## The Gazebo Simulation

A Gazebo simulation is defined in a "world" file. This includes:

 - The geometry of the simulated environment.
 - Any robots.
 - For each robot: Geometry + Plugins
 - Plugins define the behavior of sensors and actuators.

Looking at the HW01 world:

 - There's a bunch of obstacles.
 - There's a robot named "teapot".
 - The robot has a model and a plugin.
 - The model indirectly includes another plugin: the lidar.
 - The indirect plugin provides the lidar sensor.
 - The plugin, libcar\_control_plugin provides three things:
   - A velocity actuator.
   - A turn actuator.
   - A pose sensor.

These sensors and actuators are provided through Gazebo's pub-sub system. Any
program with access to the message bus can:

 - Publish messages to topics.
 - Subscribe to topics and recieve the messages published there.
 
The messages are serialized using Google's Protocol Buffers. This makes
cross-language interop pretty easy - at the cost of sometimes needing to copy
data between logically identical structures.

### The Control Plugin

Mostly this is just useful to read through as an example, but the core thing I
want to point out here is the gazebo::transport stuff:

 - this->node->Subscribe lets us specify a callback for messages on a topic.
 - this->node->Advertise gives us a pub object which we can Publish messages
   on.


## The Control Program

The starter control program is simple. In brain.cc:

 - A main function starts things up.
 - A callback function gets called when sensor data arrives, allowing
   us to change our actuator commands.

This is enabled through an abstraction layer defined in robot.hh / robot.cc:

 - This handles the Gazebo pub/sub messages.
 - Sends messages when a command is issued.
 - When message is recieved, updates robot state fields and calls the callback.

In ROS, where Gazebo is normally used, the usual method to have the same code
run in simulation and on a physical robot is to expose the same pub/sub
interface for both and write the control program to that interface.

For us, it may make more sense to do an abstraction layer in the control program
code like this example, but that'll be more clear later in the semester.
