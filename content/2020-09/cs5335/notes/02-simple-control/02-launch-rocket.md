+++
title = "Launch a Rocket"
weight = 2
+++


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

Efficiency:

 - Minimize time spent with rocket thrusting up against gravity.
 - Avoid going too fast through atmosphere, drag costs energy.
 - The traditional plan is a "gravity turn".
 - This can be handled with a function from altitude to angle.
 - I like using "sin" to generate smooth curves, but that may not be optimal.
