+++
title = "Welcome: 03 Assembly"
weight = 3
+++

## C -> ASM

 - "Programming" means "writing C code".
 - On Linux-like (UNIX, *nix, POSIX) systems, the operating system
   API is primarily exposed to C programs through the system C library.
 - The hardware doesn't run C though - it runs amd64 machine code (on your
   laptop) or ARM machine code (on your phone) or maybe some other machine
   code.
 - Machine code is for machines, not humans, so it's hard to read.
 - Machine code is a series of instructions. If you write the instructions
   down as text, you get assembly language.
 - To run a C program, you need to translate to machine code (or "binary").
 - Conceptually, and historically, you first translate C -> ASM, then 
   ASM -> binary.
 - You can still do this if you explicitly ask for it.

Note: For the first few homeworks you will be writing ASM programs. You
should *not* have a compiler do this for you. Submitting compiler output
for an assembly assignment is worth zero points.

Example:

```
// A C program is a collection of functions.
// Here's a minimal program with one function
int
main(int argc, char* argv[])
{
  printf("Hello C program\n");
  return 0;
}

```

```
# Direct C => binary
$ gcc -o hello hello.c
$ ./hello

# C => asm
$ gcc -S -o hello.s hello.c
# take a look at hello.s

# asm => binary
$ gcc -o hello hello.s
$ ./hello
```

Interesting stuff in hello.s:

 - The string is there, but no newline.
 - The main function exists
   - Starts at label "main"
   - Ends at "ret".
   - Declared ".globl"
 - In the main function another function is called - not printf, but puts.
 - The optimizer got to us.

Let's tell it to be less clever:

```
# C => asm
$ gcc -fno-builtin -S -o hello.s hello.c
# take a look at hello.s
```

 - Now the string has a newline.
 - And the function called is "printf".

How about with two functions:

```
// add1.c
long
add1(long x)
{
    return x + 1;
}

int
main(int _ac, char* _av[])
  // initial _ marks args as not used
{
    long x = add1(5);
    printf("%ld\n", x);
    return 0;
}
```

```
# C => asm
$ gcc -S -o add1.s add1.c
# take a look at hello.s
```

 - Two functions: add1, main
   - each starts at label, ends at "ret"
 - In main, the value 5 is moved to "%rdi"
   - That must be where the function's first argument goes.
   - No, that's "%edi"
   - I said "%rdi", wait a second...
 - Then add1 is called
 - In add1, the value from %rdi goes to some places.
 - Eventually, "addq $1, ..." happens to it.
 - Back in main, %rax is moved to %rsi, and printf is called.

This almost makes sense, but it's a bit of a mess. Let's figure it out.
