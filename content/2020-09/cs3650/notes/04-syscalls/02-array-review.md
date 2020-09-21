+++
title = "C Array Review"
weight = 2
+++

## Arrays and Pointers

 - Arrays in C are just like arrays in ASM. They're a contigous sequence of
   memory starting at some address.
 - Array variables store the address of the start of the array.
 - C knows how big the type stored in array is.
 - For arrays in ASM, we had to manually calculate the byte offsets.
 - An array of words in C would be xs[0], xs[1], etc.
 - Pointers are variables that store memory addresses with an associated type
   so "int\*" (int pointer) is the address of an int.
 - C lets you do arthmetic with pointers.
   - If you add one to an int pointer, it steps to the next int-sized chunk of memory.
     So if p is a pointer to a 4 byte int, then (p + 1) is the address increased by
     4 bytes.
   - Show sizeof: char, short, int, long, float, double, char\*, long\* 
 - Array varibles and pointers are the same thing with different notation.
 - If pp is a pointer and aa is an array, both of the same type pointing to the same
   address, then pp[3] and \*(pp + 3) are the same thing.
 - Strangely, pp[ii] and ii[pp] are the same thing too.
   - Why?

