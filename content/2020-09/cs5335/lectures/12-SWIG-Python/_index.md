+++
title = "Robots Lecture 12: SWIG / Python"
weight = 12
+++

# Using SWIG to expose a C++ Interface in Python

In this exiting text lecture, we're going to be covering how to use the SWIG
tool to expose a C++ module to Python code.

## Step 1: Install SWIG

```
$ sudo apt install swig
$ sudo apt install python3-dev
```

 * On Debian 10, this gets you SWIG 3
 * You may get a newer version on Ubuntu 20.04 - I'd expect it to work exactly
   the same for the functionality we're using.

## Step 2: Look at the C++ Module

For this example, we'll be using the robot.cc / robot.hh [module from the HW08
starter
code](https://github.com/NatTuck/cs5335hw-gazebo/blob/master/hw08/brain/robot.hh).
Note that this technique could easily be extended to wrap the generic Robot
module from the gz-ranger-combo example code - you'd just need a factory
function to produce specific C++ class instances for Python.

We'd like to expose a subset of the public interface of the Robot class to our
Python code:

 * Fields: ```pos_x, pos_y, range, pos_t```
 * Methods: ```do_stuff(), set_vel(double, double)```
 * Constructor and destructor

From the perspective of client code, the callbacks like ```on_scan``` or
```at_goal``` are implementation details. The ```frame``` field should be
exposed, but that would complicate things significantly.

## Step 3: Write a SWIG Interface Definition

SWIG operates by generating a wrapper around the functionality exposed by a
single C or C++ header file that provides that same functionality as a module in
another language like Python.

If wrapping a C module, SWIG primarily exposes **functions**. When wrapping a
C++ module, SWIG also exposes **classes**, including generating wrapper classes
in the target language which allow C++ methods and member variables to be
accessed for a class instance.

In order for SWIG to do it's job, it needs an interface file. This is a file
with a ```.i``` extension that tells SWIG which parts of the module we actually
want to wrap.

In simple cases, you can say "wrap everything in the header", but frequently you
want to only expose a subset of the module because some features are useless or
not easily handled by SWIG.

So here's a first shot at an interface file, ```robot.i```:

```
/* this is a comment */
/* swig interface file starts with a prelude */
%module robot
%{
#include "robot.hh"
%}

/* after the header, we use C++ header syntax to say what we're exporting */
class Robot {
  public:
    void (*on_update)(Robot*);

    float pos_x;
    float pos_y;
    float range;
    float pos_t;

    Robot(int argc, char* argv[], void (*cb)(Robot*));
    ~Robot();

    void set_vel(double lvel, double rvel);
    void do_stuff();
};
```

The interface file starts with a prelude which sets the name of the output
Python module and gives the name of the actual header file to be included in the
generated C++ code.

After that is a valid C++ class declaration that leaves some stuff out that we
don't need to wrap like ```private``` sections and the ```frame``` field we've
chosen not to export.

## Step 4: Add a build rule for SWIG stuff

Running SWIG will generate two files for us:

 * ```robot_wrap.cxx``` - Source for a native Python module exposing our stuff.
 * ```robot.py``` - Adapter code in Python to clean up the native module's ugly
   interface.

The actual command is:

```
$ swig -Wall -c++ -python robot.i
```

This tells SWIG to generate a Python module wrapping a C++ module as defined in
"robot.i".

This can be integrated into a Makefile. See the [final result
here](https://github.com/NatTuck/cs5335hw-gazebo/blob/master/python-test/brain/Makefile). It also [works with cmake](https://github.com/Mizux/cmake-swig).

## Step 5: Write a Python program

Here's a first attempt at a Python program:


```
#!/usr/bin/env python3

from robot import Robot

def callback(rbt):
    print(rbt.pos_x)


rbt = Robot(0, [], callback)
rbt.do_stuff()
```

If we start Gazebo and try this, it won't work. There are two problems:

 * The SWIG wrapper can't automatically translate a Python function into a C++
   function pointer, so we can't pass the callback without more work.
 * The types for argc and argv don't quite match.

These issues could be solved with a fancier SWIG interface file, but it's
simpler to just refactor the target C++ module to avoid them.

Here's the second attempt at a Python program:

```
#!/usr/bin/env python3

from robot import Robot

rbt = Robot()
while rbt.update():
    print(rbt.pos_x)
```

We don't need to pass argc/argv, and it's not strictly nessisary for the C++
code to control the main loop.


## Step 6: Refactor the C++ module

To construct a Robot object with no constructor arguments, we can just add an
extra constructor:

```
Robot::Robot()
    : Robot(0, 0, 0)
{
}
```

We can refactor our ```do_stuff()``` function to call an ```update()``` function
every iteration:

```
bool
Robot::update()
{
    if (this->at_goal()) { 
        this->set_vel(0.0, 0.0);
        this->done();
        return false;
    }

    gazebo::common::Time::MSleep(10);
    return true;
}

void
Robot::do_stuff()
{
    while (update()) {
        this->on_update(this);
    }

    gazebo::common::Time::MSleep(100);
}
```

This slightly changes the semantics of our Robot interface: Instead of executing
logic whenever we get new sensor data, we execute at a fixed 100Hz whether
there's new data or not. This isn't optimal, but it should work fine.

One more thing to fix:

```
void
Robot::on_scan(ConstSonarStampedPtr &msg)
{
   ...
   this->on_update(this);
}
```

That segfaults if we use the no-args constructor. Instead, we want:

```
void
Robot::on_scan(ConstSonarStampedPtr &msg)
{
    ...
    if (on_update) {
        this->on_update(this);
    }
}
```

Same thing for the other places where ```this->on_update(this)``` gets called.


## Results

Here are the starting and ending programs:

 * [HW08 starter brain](https://github.com/NatTuck/cs5335hw-gazebo/tree/master/hw08/brain)
 * [With Python](https://github.com/NatTuck/cs5335hw-gazebo/tree/master/python-test/brain)

More stuff to look at:

 * The remaining two issues, callbacks and the cv::Mat, can be solved using SWIG
   typemaps.
 * But it might be practically easier to have the C++ code write the frame image
   out to disk and then load it in Python with cv.imread. Due to disk caching
   this shouldn't be a fatal performance hit.



