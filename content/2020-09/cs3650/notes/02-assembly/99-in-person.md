+++
title = "3650 Week 2: 99 In Person"
weight = 99
+++

## First: HW Questions

 - Homework questions?
 - HW02 is available.

## Reminder: Course Website

 - https://ntuck-neu.site/
 - Late registration? Check course website.

## Assembly Recipe

 1. Signature
 2. Pseudocode (= C code)
 3. Variable Mappings
 4. Skeleton
 5. Write the body of the functions
 
## What do the enter and leave instructions do?

```
  /* enter allocates a stack frame */
  /* the enter $X, $0 instruction acts like: */
  push %ebp
  mov %esp, %ebp
  sub $X, %esp
  /* waste 8 clock cycles */

  /* leave deallocates a stack frame */
  /* the leave instruction acts like: */
  mov %ebp, %esp
  pop %ebp
```

## Sample Problem

 - Read a number from argv[1]
 - Print the numbers counting down to zero.
 - Do this with a recursive function.

```
void
countdown(long xx)
{
   printf("%ld\n", xx);
   
   if (xx > 0) {
     countdown(xx - 1); 
   }
}

int
main(int argc, char* argv[])
{
    if (argc != 2) {
       puts("bad usage");
       return 1;
    }

    long xx = atol(argv[1]);
    countdown(xx);
}
```

## Questions?
