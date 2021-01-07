+++
title = "Threads: Intro"
weight = 3
+++

## Introducing Threads

 - show create.c
 - Discuss how threads change the virtual memory story.

## Using Semaphores

 - Sem-queue example
 - This is way less safe than just using locks. Requires careful analysis.

## Insufficiently careful analaysis of sem-queue

Initial model: queue array has infinite size

 - qii stores the index where we will insert the next item
 - isem stores the number of logically free slots in the queue
 - Inserting is safe: qii is atomicly incremented after each insert, so
   it always points to a never-before-used slot.
 - qjj stores the index where we will extract the next item
 - qjj is incremented after each extract, so it will always point to the next
   item that hasn't been extracted
 - osem stores the number of full slots; initially zero
 - osem is incremented only after an insert, so decrementing it is guaranteed
   to provide access to a slot that has been written its single time

Modification: Queue is finite size.

 - qii and qjj are used MOD(size). This causes slots to be reused both for writing
   and for reading as the counter wraps around.
 - We need to guarantee that reuses never overlap with the previous use.
 - At most (size) items can be in the queue at once. This guarantees that no
   matter where the queue data starts in the buffer, it can never overfill by
   wrapping around.
 - A read can never wrap around either, since that would require an osem value
   greater than size.
 - We have an invariant that isem + osem <= size. Why?
 - Does that demonstrate that a read can never wrap around to a write?
 
Modification: Integers are finite size.

 - Unsigned integers wrap on overflow.
 - As long as the buffer size evenly divides into the integer range, then
   this isn't a problem.
 - Why?

## More with Threads

Now we have two ways to support parallel execution on a Linux system:

 * We can spawn multiple processes with fork()
 * We can execute multiple threads within a single process.

Key difference: With threads, all memory is shared by default.

 - Advantage: Allocating shared memory post-spawn.
 - Disadvantage: 100% data races

With threads, we can get broken behavior even easier than before.

 * Show thread sum101 examples.

