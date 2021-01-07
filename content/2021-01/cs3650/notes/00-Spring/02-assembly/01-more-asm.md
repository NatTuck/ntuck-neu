+++
title = "3650 Week 2: 01 ASM Function Call"
weight = 1
+++

## avg example

Example: [avg.S](../avg.S)

```
$ gcc -no-pie -o avg avg.S
```

Argument registers: The convention for AMD64 Linux assembly is to pass
arguments in registers: %rdi, %rsi, %rdx, %rcx, %r8, %r9, ...stack

Functions return a value in the %rax register.

idiv is weird:

 - Implicit 128 bit dividend: 
   - High bits in %rdx
   - Low bits in %rax
   - Need to zero %rdx for 64-bit divison
 - Two outputs:
   - Quotient in %rax
   - Remainder in %rdx

