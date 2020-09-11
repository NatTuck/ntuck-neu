+++
title = "3650 Week 2: 01 More Assembly"
weight = 99
+++

## add1 again

(grab the asm from last class)

Argument registers: The convention for AMD64 Linux assembly is to pass
arguments in registers: %rdi, %rsi, %rdx, %rcx, %r8, %r9, ...stack

Functions return a value in the %rax register.

## Another Assembly Example

First, Scan through the AMD64 instruction list on course site.

Example: [ifact.S](./ifact.S) (iter)

```
$ gcc -no-pie -o ifact ifact.S
```

## idiv example

```
.global main
.text
main:
  enter $0, $0
  
  mov $40, %rax
  mov $30, %rbx
  mov $20, %rcx
  mov $10, %rdx
  
  # cqo 
  idiv %rdx
 
  # mov %rdx, %rdi
  # cqo 
  # idiv  %rdi
  
  mov $longfmt, %rdi
  mov %rax, %rsi
  mov $0, %al
  call printf
 
  leave
  ret
.data
longfmt: .string "%ld\n"
```

More Examples:

 - fact (recursive)
 - strlen

 - fact hits the recursion problem, talk about register conventions
 - Talk about the ABI: https://github.com/hjl-tools/x86-psABI/wiki/X86-psABI
 - Programmer Manual: https://support.amd.com/TechDocs/24594.pdf
 


