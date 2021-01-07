+++
title = "Page Tables"
weight = 1
+++

 - Next assignment: Memory Allocator
 - First, some more notes on virtual memory.

## Page Tables

 - Each process gets its own virtual address space.
 - Virtual memory is managed in pages (usually 4k chunks).
 - That means each process needs its own lookup table for 4k pages.
 
32-bit page tables 

 - How many potential 4k pages in a 32-bit address space?
   - 4k = 2^12, 2^32/2^12 = 2^20 = 1M
 - How big is a page table entry?
   - Virtual address prefix: 20 bits
   - Physical address prefix: 20 bits
   - + permissions
   - + flags
   - = At least 64-bits = 8 bytes.
 - So with a simple design, that means each page table is 8MB.
 - You want to keep the page table in RAM.
 - Early 32-bit machines had as little as 4 meg of RAM.
 - Clearly, that's not how page tables actually work.

Multi-level page tables.

 - Instead, 32-bit page tables are stored in a 2-level sparse tree.
 - Each process has a 1024 entry top level page table = 8k
 - Each entry in that table points to another 1024-entry sub table = 8k
 - Second level tables with no entries are simply not allocated.
 - Minimum size for a processes's page tables = 16k.

64-bit page tables

 - Two 10-bit levels isn't enough.
 - So instead four 9-bit levels are used.
 - This adds up to 36 bits, which gives 36 + 12 = 48 bits of virtual address space.
 - Otherwise, same idea.

Problem: Programs use virtual addresses.

 - We want an instruction like "lw (addr)" to use a virtual address.
 - The hardware by default works with physical addresses.
 - Fix: We implement virtual address translation in hardware, using a MMU.
 - The operating system is able to configure the processor to either use a
   page table or not, and if so which one.
 - Disadvantage: The page table format is set by the hardware. We can't try
   alternatives easily. Some hardware does translations in software (e.g. Sparc), 
   but this sounds slow.

Problem: Every virtual address lookup requires a page table lookup.

 - An instruction like "lw (addr)" uses a virtual address.
 - The actual memory, needs a physical address.
 - So we need to load the translation from the page table.
 - We need to load part of the translation from each level of the page table.
 - On a 64 bit system, that means every load is actually 5 loads 
   (1 for the data, 4 for the translations).
 - That would slow us down a lot.

Solution:

 - Cache the translations in a dedicated cache.
 - Once we've done one load or store from a 4k page, it's pretty likely we're
   going to do more on the same page soon.
 - For linear reads/writes of 64-bit machine words, this changes the overhead 
   from 400% to 0.7%
 - This cache is called the Translation Lookaside Buffer. Every core has one.

## TLB Example

```
int* xs = // two pages of stuff;
int sum = 0;
for (int ii = 0; ii < 2048; ++ii) {
    sum += xs[iii];
}
```

Without TLB, with four level table:

 2048 * 5 = 10k

With TLB, with four level table:

 2048 + 2\*4 = 2056

 - Two pages, so two TLB misses, so we traverse the table twice.
 - Other 2046 translations handled from the TLB.

## Context Switches

 - Consider a one-core processor running two processes.
 - We want to share the core between the two processes.
 - So the operating system makes them take turns.
 - After a fixed amount of time, one process is stopped and the other gets
   a chance to execute.

How to switch processes:

 - A hardware interrupt occurs, jumping us into a kernel interrupt handler.
 - The handler saves off the current values for all the registers onto the 
   process stack.
 - The kernel picks a new process to run.
 - The kernel tells the processor to use the page tables for the new process.
 - The saved registers for the new process are loaded from its stack.
 - We return from the interrupt handler into the new process.

This is reasonably quick, except for one key thing: All the TLB entries have
been invalidated. This means that every access to a new page is going to be five
memory reads for a bit.

This is one way that threads are concretely faster than processes. Since threads
share a virtual address space, context switches between threads can skip the step
where the page table is switched and the TLB is invalidated.

Other causes for context switches:

 - Blocking inter-process communication, like semaphores, and message queues.
 - Blocking on I/O.
 - Blocking for any other reason.

Generally blocking is faster than the alternative, since it gets processes with
nothing to do out of the way, but it can get expensive to do it a million times
a second.

