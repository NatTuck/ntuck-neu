+++
title = "12 - Python / SWIG"
+++

Using SWIG to wrap our Robot module for access from Python


```
# Makefile
BIN := brain
SO  := _robot.so

SRCS := $(wildcard *.cc)
OBJS := $(SRCS:.cc=.o)
HDRS := $(wildcard *.hh)

CFLAGS := -g -fPIC $(shell pkg-config --cflags gtk+-3.0 x11 gazebo opencv python3)
LIBS   := $(shell pkg-config --libs gtk+-3.0 x11 gazebo opencv python3)

all:
	make -j $(BIN)
	make -j $(SO)

$(SO): robot.o robot_wrap.o
	g++ -shared $(CFLAGS) -o $(SO) robot.o robot_wrap.o $(LIBS)

$(BIN): $(OBJS)
	g++ $(CFLAGS) -o $(BIN) $(OBJS) $(LIBS)

%.o: %.cc $(HDRS)
	g++ -c $(CFLAGS) -o $@ $<

robot_wrap.cc: robot_wrap.cxx
	mv robot_wrap.cxx robot_wrap.cc

robot_wrap.cxx robot.py: robot.i
	swig -Wall -c++ -python robot.i

clean:
	rm -f *.o $(BIN) robot_wrap.cxx robot.py *.so

prereqs:
	sudo apt install libopencv-dev opencv-doc libgtk-3-dev

.PHONY: clean all
```

```
/* robot.i */
%module robot
%{
#include "robot.hh"
%}

class Robot {
  public:
    void (*on_update)(Robot*);

    float pos_x;
    float pos_y;
    float range;
    float pos_t;
    cv::Mat frame;

    Robot();
    ~Robot();

    void set_vel(double lvel, double rvel);
    bool update();
};
```

```
#!/usr/bin/env python3
# brain.py

from robot import Robot

rb = Robot()
while rb.update():
    print(rb.pos_x, rb.pos_y, rb.pos_t, rb.range)
```


```
// Selected logic from robot.cc
Robot::Robot()
    : Robot(0, 0, 0)
{
}

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



