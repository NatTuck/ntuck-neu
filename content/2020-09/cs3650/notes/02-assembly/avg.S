    .global main
    .data
fmt:
    .string "avg(7, 3) = %ld\n"
    .text

    // avg(x, y) = (x + y) / 2
avg:
    enter $0, $0

    add %rdi, %rsi

    mov %rsi, %rax

    mov $2, %rdx
    idiv %rdx

    //cqo
    //mov $2, %r10
    //idiv %r10

    leave
    ret

main:
    enter $0, $0

    mov $7, %rdi
    mov $3, %rsi
    call avg

    mov $fmt, %rdi
    mov %rax, %rsi
    mov $0, %al
    call printf

    leave
    ret
