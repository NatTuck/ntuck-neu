+++
title = "Welcome: In Person Notes"
weight = 1
+++

## First thing

 - Instructor: Nat Tuck
 - Course: CS3650 - Computer Systems
 - My site: https://ntuck-neu.site/

## The Plot

Where does this course fit in?

 - You're a CS major, or maybe from COE.
 - You can write computer programs.
 - In this course, we explore some of the details of how
   actual programs run on concrete computers.

The plot:

 - To do things, programs need to use hardware resources.
 - 1980 personal computer: one program at a time.
 - Two programs at a time means conflicts (who gets input from
   keyboard? don't want to mix output to line printer!)
 - Add a dedicated program to talk the the hardware: the OS. Other
   programs ask the OS to access shared resources for them.
 - To ask the OS to do stuff for you, you make a system call.
 - This class is about writing programs that use system calls.
 - System calls are different on different operating systems,
   so we need to pick a specific one to use.
 - We're using Linux. More specifically, Debian 10.
 - Even with an OS, programs are still written to target a specific
   hardware archetecture.
 - Compiled programs are binary data - machine code - and different
   kinds of processors have different machine codes.
 - We'll be using the normal archetecture for desktop / laptop computers,
   the AMD64 archetecture.
 - A platform is the combination of processor archetecture and OS,
   for us that's AMD64 Linux.

 - Course Site / Syllabus
 - Piazza
   - If you get stuck, you can ask questions here.
   - You shouldn't generally post code.
   - Not for direct messages to course staff: use email or possibly
     a Teams DM.
 - Teams
   - Use general chat.
 - AMD64 hints links
 - Inkfish
 - Office Hours start next Monday.

## Pandemic Adaptions

 - Course structure is flipped: Online video lectures are the lectures.
 - Each week has one set of video lectures, which should be watched before
   coming to in-person meetings.
 - In-person meetings are optional, and will consist of demos and Q&A.
 - The demos will frequently be the same for the two meetings in a week.
 - In-person meetings are streamed via Zoom - you can ask questions remotely
   using Zoom chat.
 - Office hours are online using Teams.

Attending in-person meetings:

 - Wear a mask
 - Maintain social distancing
 - Arrive on time; if you're more than a couple minutes late, you may not be
   allowed in.
 - Entering and leaving will take extra time to avoid mobs at the door
 - Expect setup to take a few minutes
 - Expect meetings to end early
   - Because we need to leave time to allow for setup/teardown
   - Because we're out of Q&A questions

## Inkfish

 - Show Inkfish
 - Show HW01

## Syllabus

 - There's a schedule. It may resemble what happens.
 - Grades: Assignments.
 - Homework: These are difficult programming assignments.
 - Challenges: These are very difficult programming assignments that you are not
   expected to get 100% on.
 - You are expected to get stuck on assignments. Leave time to get unstuck. Plan
   on getting stuck twice on a HW and five times on each challenge.

Cheating

 - Copying code without clear, written attribution is plagarism.
 - If you submit plagarized work, you fail the course.
 - You're not allowed to share solution code with other students either.
 - If you cheat, you get reported to the college, which is bad.
 - You are given starter code for assignments, you can use that.
 
 - There is code shown in lecture. It's not starter code, so using
   it without attribution is plagarism. This is the one case where I
   might be lenient on the policy, but I also may just give you an
   F for the semester on the first offense.

The best way to avoid cheating (and the best way to learn the content
in this course), is to personally type your own code. Don't download
other people's solutions, don't copy and paste other people's code, etc.
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

More complex example:

```
.global main
.text

main:
  enter $0, $0

  # print prompt
  mov $prompt, %rdi
  call puts

  mov $long_fmt, %rdi
  mov $num, %rsi
  mov $0, %al
  call scanf

  # copy value at address
  # with dollar sign, copy literal address
  mov num, %rax

  # if (%rax <= 10)
  cmp $10, %rax
  jle smaller_than_ten

bigger_than_ten:
  mov $bigger, %rdi
  jmp main_done

smaller_than_ten:
  mov $smaller, %rdi

main_done:
  call puts

  leave
  ret

.data
num: .string "12345678" # 8 bytes, to fit a long
prompt: .string "enter a number"
long_fmt: .string "%ld"
eol: .string "\n"
bigger: .string "bigger than ten"
smaller: .string "smaller than ten"
```
