+++
title = "./15-threads-pt2/notes.md"
+++

## Conditon Variables

 - [Seq Stack](../seq-stack.c)
 - [Condvar stack](../par-stack.c)

## Other stuff

These things are a usually bad idea compared to just using mutexes:

 - show atomic-sum101; compare to mutex and parallel versions
 - write it with pthread\_spin\_lock
 - write our own spinlock with atomic\_compare\_exchange\_strong
   - need to google the docs; too new for a manpage
   - bad ideas include sched\_yield




