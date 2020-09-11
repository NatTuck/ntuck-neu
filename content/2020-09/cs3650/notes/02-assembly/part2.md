+++
title = "./03-asm-conventions/notes.md"
+++

## Compare

 * compare.S
 * Explain prototype for "main".
 * Draw the array of strings memory layout.
 * Explain strings; null termination.

## Review Recursive Factorial

 - Introduce the stack
 - Draw the stack, with %rsp and %rbp
 - Walk through fact(2), showing the stack contents.


## Data Directives

```
.global main
.text
main:
  enter $0, $0
  
  mov $longfmt, %rdi
  mov $foo, %rsi
  mov $0, %al
  call printf

  mov $longfmt, %rdi
  mov $bar, %rsi
  mov $0, %al
  call printf
  
  mov $longfmt, %rdi
  mov $baz, %rsi
  mov $0, %al
  call printf
  
  leave
  ret

.data
longfmt:
  .string "%ld\n"
# .align 16
foo: 
  .space 24, 0
bar: 
  .int 10
baz:
  .int 20
  .int 30
  .int 40
```

# More Examples

 * Use the recipe to build a "too low / too high" guessing game.
   * main calls play_game in a loop.
   * play\_game calls get\_guess and check\_guess in a loop

