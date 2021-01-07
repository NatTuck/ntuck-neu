+++
title = "ch02 notes"
+++

# Challenge 2:

 - Challenge 2 is posted.
 - You need to request a team by Tuesday or you're working alone.
 - The assignment is to create an optimized memory allocator.
   - The base assignment is to pass the tests and be faster than your HW08
     allocator modified to be thread safe.
   - The challenge is to beat the system allocator.
 - Your allocator should *work* in the general case, and be very
   fast on the two provided test cases.
 - Test cases:
   - Collatz Conjecture
   - Linked List
   - Vector

## Allocator Slides

[Here are some slides I stole from
Christo](http://www.ccs.neu.edu/home/ntuck/courses/2017/09/cs3650/notes/15-alloc-slides/8_Free_Space_and_GC.pptx).

Cover slides up through GC.

## Strategy for CH02

 - You're starting from a simple free-list allocator.
 - You have two problems:
   - The linked list data structure and the resulting malloc and free routines
     are slow.
   - Having a single shared free list protected by a single mutex results in a
     lot of contention. This can be avoided by having more data structures and
     more mutexes (i.e. multiple arenas) or by having some thread-local data
     structures (i.e. per-thread caches).
 - You want to do the simplest thing that could possibly work, then benchmark
   it.
 - If that's not fast enough, you want to do the simplest optimization that
   could possible work then benchmark that.
 - One tool to consider learning and trying here is gprof. It's a profiler that
   will tell you exactly where your program is spending its time.
