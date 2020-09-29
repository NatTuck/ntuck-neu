+++
title = "Orbit Example"
weight = 1
+++

## Orbits in KSP

https://en.wikipedia.org/wiki/File:Orbit1.svg

Finding absolute angle in orbit:

 - LAN - angle from fixed zero to ascending node
 - AOP - angle from AN to periapsis
 - TrueAnomaly - angle from periapsis to object

For equatorial orbits these sum together nicely and are comparable.

If the orbits are circular, then the angular movement rate of each object is
some fixed number of degrees per second.

```
function absang {
    parameter obt.
    return mod(obt:lan + obt:argumentofperiapsis + obt:trueanomaly, 360).
}

print "mun ang".
print absang(mun:orbit).

print "ship ang".
print absang(ship:orbit).
```

## Non-circular orbits

https://en.wikipedia.org/wiki/File:Mean_anomaly_diagram.png

https://en.wikipedia.org/wiki/Mean_anomaly
https://en.wikipedia.org/wiki/True_anomaly
https://en.wikipedia.org/wiki/Eccentric_anomaly

