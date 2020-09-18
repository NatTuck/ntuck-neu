+++
title = "03 - To the Mun"
weight = 3
+++

## HW03

 - Is posted
 - Goal: Write a script to land on the Mun
 - Three steps:
   - Launch
   - Transfer to Munar orbit.
   - Land

## Part 1: Mostly Manual Mun Mission

 - Going to the mun.


## Part 2: Keplerian Mechanics

 - Solid video: https://www.youtube.com/watch?v=AReKBoiph6g

## Part 3: Mun Mission Problems

### Landing Script

You can probalby get away with just landing wherever, and retry if you hit a
crazy slope or something.

One strategy is to calculate and execute a perfect "suicide burn", where you
burn at full throttle until you hit zero speed exactly when you hit zero
altitude.

Another strategy is to set a progressively lower maximum speed as the vessel
gets closer to the surface.

We can estimate start time by taking into account thrust, speed, distance, and
local gravity.

Example:

 - We're at 100km
 - We're falling at 1000 m/s
 - We're accelerating at 10 m/s^2 due to gravity.
 - We can thrust at 20 m/s^2 up
 - That gives us the ability to slow at 10 m/s^2
 - We'll hit in 100 seconds if we thrust to cancel our acceleration. 
 - We can slow to zero in 100 seconds.
 - It's a little early for a suicide burn, but probably a good time
   to start a more conservative burn.

### Transfer to Munar Orbit

Transfer burn:

 - Start: In a low, circular-ish orbit, coplanar with the Mun.
 - First, we want a transfer orbit - where our apoapsis will be in the Mun's SOI
   when we get there.
 - So we need to burn up our apoapsis to the Mun's altitude.
 - Problem: Where in our orbit do we do the burn?
 - Solution: On the opposite site of Kerbin to where the mun will be when we get
   to apoapsis.
 - Where will the Mun be? It'll get as much time to move as it takes us to get
   there.

Orbit burn:

 - Once we get to the Munar SOI, assuming we're not hitting the Mun, we need to
   circularize at periapsis.





