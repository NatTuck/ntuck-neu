+++
title = "Welcome: 01 Topics"
weight = 1
+++

Where does this course fit in?

 - You're a CS major, or maybe from COE.
 - You can write computer programs.
 - In this course, we explore some of the details of how
   actual programs run on concrete computers.

The plot:

 - To do things, programs need to use hardware resources.
 - 1980 personal computer: one program at a time.
 - Two programs at a time means conflicts (who gets input from
   keyboard? don't want to mix output to line printer!)
 - Add a dedicated program to talk the the hardware: the OS. Other
   programs ask the OS to access shared resources for them.
 - To ask the OS to do stuff for you, you make a system call.
 - This class is about writing programs that use system calls.
 - System calls are different on different operating systems,
   so we need to pick a specific one to use.
 - We're using Linux. More specifically, Debian 10.
 - Even with an OS, programs are still written to target a specific
   hardware archetecture.
 - Compiled programs are binary data - machine code - and different
   kinds of processors have different machine codes.
 - We'll be using the normal archetecture for desktop / laptop computers,
   the AMD64 archetecture.
 - A platform is the combination of processor archetecture and OS,
   for us that's AMD64 Linux.
