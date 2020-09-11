+++
title = "3650 Week 2: 01 More Assembly"
weight = 99
+++

## avg example

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
 


## Another Assembly Example

First, Scan through the AMD64 instruction list on course site.

Example: [ifact.S](./ifact.S) (iter)

```
$ gcc -no-pie -o ifact ifact.S
```


More Examples:

 - fact (recursive)
 - strlen

 - fact hits the recursion problem, talk about register conventions
 - Talk about the ABI: https://github.com/hjl-tools/x86-psABI/wiki/X86-psABI
 - Programmer Manual: https://support.amd.com/TechDocs/24594.pdf
 


