+++
title = "addzs"
weight = 2
+++


## Predicting CPU Performance

My Laptop: Thinkpad X1 Yoga G3 w/ Intel Core i7-8650U

```
$ lscpu
```

We've got 4 cores, each running at 1.9 GHz normally, but boosting up to 4.2 GHz
for sequential tasks.

We're worried about a single-threaded program, so for round numbers, 
let's call that 0.25 ns/cycle.

Each core can do an add every cycle, so code like this should
run at about 4 billion adds / second:

```
for (;;) { a += 5; } 
```

To complicate things further, there are actually four ALUs that can
each do an add per second if they don't depend on each other.

Code like this can do 16 billion adds/second:

```
for (;;) { a += 5; b += 5; c += 5; d += 5; }
```

Take a look at addzs.c

 - We're adding 500M integers
 - The adds themselves should take about 1/8th of a second.
 - But we're loading them from memory.

Let's consider the memory heirarchy.

```
sudo lshw -C memory
lstopo
```

 - Main Memory:
   - Size: 16GB of DDR3 2133
   - Latency: 60ns = 240 cycles
   - Throughput: 20 GB/s
 - L3 Cache:
   - Size: 8 MB (shared)
   - Latency: 11ns = 44 cycles
   - Throughput: > 200 GB/s 
 - L2 Cache:
   - Size: 256 KB (per core)
   - Latency: 3ns = 12 cycles
   - Throughput: > 400 GB/s
 - L1 Data Cache:
   - Size: 32k (per core)
   - Latency: 1ns = 4 cycles
   - Throughput: > 1000 GB/s

[addzs.c](../addzs.c)

1B ints = 4 GB, so the memory can easily ship that in 1 second.

But if every int is requested separately, it'll take 60ns * 1B = 60s

We know that cache requests loads from RAM in 64-byte cache lines, so
we only have 1B/8 = 125M cache misses. So we can estimate 7.5 seconds
to execute this code. Let's try it.

... Off by a factor of 2. Not too bad.

...

There's one more element in this story though. The processor has special
hardware to detect sequential memory accesses and preload the data into
cache to avoid unnessisary latency.

Let's try running the program with optimizations.

## Bonus Stuff

 * Christo's slides (8-16)

