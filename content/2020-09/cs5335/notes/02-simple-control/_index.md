+++
title = "02 - Simple Robot Control"
weight = 2
+++


# Topic: Obstacle Avoidance

 - Sensors
 - Reactive vs Stateful
 
# Topic: Launching a Rocket to Orbit

 - Rocket works by shooting hot gas backwards to push rocket forwards.
 - Go up to get above atmosphere and avoid drag.
 - Go sideways fast enough to miss planet when falling down (~2200 m/s @ Kerbin)

Stuff a launch script needs to do:

 - Intially launch rocket.
 - Staging: When a rocket stage gets empty, we need to drop it and start the
   next one.
 - Point rocket in correct direction at each point in the flight.
 - Stop burning when apoapsis reaches target altitude.
 - Calculate and perform circularization burn at apoapsis.
