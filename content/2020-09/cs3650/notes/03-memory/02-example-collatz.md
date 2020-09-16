+++
title = "Example: Collatz"
weight = 2
+++

### Example 1: Collatz Conjecture

 - Start with an integer > 1.
 - If even, divide by two.
 - If odd, take 3*x+1.
 - Iterate repeatedly

The conjecture:

 - All integers > 1 eventually get you to one.

Our program will take an input on the command line and
print the sequence to one and the number of iterations. 


```
long
iterate(long x)
{
  if (x % 2 == 0) {
    return x/2;
  }
  else {
    return x*3 + 1;
  }
}

int
main(int argc, char* argv[])
{
  long x = atol(argv[1]);
  long i = 0; 
  
  while (x > 1) {
    printf("%ld\n", x);
    x = iterate(x);
    i++;
  }
  
  printf("i = %ld\n"):
  return 0;
}
```

Now, translate to ASM with the recipe. 

Note patterns for "if" and "while" statements.

