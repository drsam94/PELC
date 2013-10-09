    .text
    .globl  isPrime
    .type   isPrime,@function
isPrime:
    pushq   %rbx
    pushq   %r12
    pushq   %r13
    pushq   %r14
    pushq   %r15
    movl    %edi,%ebx   # ebx = n
    cmpl    $2,%ebx     # n < 2
    jl      finif       # return 0
    movl    %ebx,%eax   # temp = 2
    andl    $1,%eax     # temp&= 1
    cmpl    $0,%eax     # n % 2 == 0
    je      finic       # return n == 2
    movl    $3,%r12d    # i = 3
loop:
    movq    $0,%rdx     # clear rdx for mul
    movl    %r12d,%eax  # put i in eax for mul
    imull   %r12d       # eax = i * i
    cmpl    %ebx,%eax   # i * i <= n
    jg      overloop
    movq    $0,%rdx     # clear rdx for div
    movl    %ebx,%eax   # put n in eax for div
    idivl   %r12d       # edx = n % i
    cmpl    $0,%edx     # n % i == 0
    je      finif       # return 0
    addl    $2,%r12d    # i+=2
    jmp     loop
overloop:
    movq    $1,%rax     # return 1
    jmp     fini
finif:
    movq    $0,%rax     # return 0
    jmp     fini
finic:
    cmpl    $2,%ebx     # n == 2
    jne     finif
    movq    $1,%rax     # return 1
fini:
    popq    %r15
    popq    %r14
    popq    %r13
    popq    %r12
    popq    %rbx   
    ret
    .size   isPrime,.-isPrime

    .text
    .globl  pfc
    .type   pfc,@function
pfc:
    pushq   %rbx
    pushq   %r12
    pushq   %r13
    pushq   %r14
    pushq   %r15
    movl    %edi,%ebx   # ebx = n
    movl    $0,%r13d    # fc  = 0
    movl    $2,%r12d    # i = 2
loop2:
    movl    %ebx,%edi   # n is param 1
    call    isPrime     # isPrime(n)
    cmpl    $1,%eax     # if true
    je      finish
    cmpl    $3,%r13d    # if fc is 3 and not prime, return false
    je      finishFalse
    movq    $0,%rdx     # clear rdx for div
    movl    %ebx,%eax   # put n in eax for div
    idivl   %r12d       # eax: n%i, edx: n/i
    cmpl    $0,%edx     # n%i == 0
    jne     overif
    movl    %eax,%ebx   # n /= i
    incl    %r13d       # fc++
divloop:                # perform extra divisions of the factor
    movq    $0,%rdx     # clear rdx for division
    movl    %ebx,%eax   # put n in eax for div
    idivl   %r12d       # compute division again
    cmpl    $0,%edx     # n%i == 0
    jne     overdivloop
    movl    %eax,%ebx   # n /= i
    movl    %ebx,%edi   # n is param 1
    call    isPrime     # we must recheck primality here
    cmpl    $1,%eax     # if isPrime
    je      finish
    cmpl    $1,%ebx     # if 1
    je      finish
    jmp     divloop
overdivloop:
overif:
    incl    %r12d       # i++
    jmp     loop2
overloop2:
finish:
    cmpl    $3,%r13d    # fc == 3
    je      finishTrue
finishFalse:
    movq    $0,%rax  
    jmp     veryend
finishTrue:
    movq    $1,%rax
veryend:
    popq    %r15
    popq    %r14
    popq    %r13
    popq    %r12
    popq    %rbx   
    ret
    .size pfc,.-pfc
    
    .text
    .globl  e47
    .type   e47,@function
e47:
    pushq   %rbx
    pushq   %r12
    pushq   %r13
    pushq   %r14
    pushq   %r15
    movl    $210,%ebx   # N = 210 (lowest possible num)
    movl    $0,%r12d    # count = 0
loop3:
    movl    %ebx,%edi   # N is param 1
    call    pfc
    cmpl    $1,%eax     # pfc(N) == 1
    jne     elsepart
    incl    %r12d       # count++
    cmpl    $1,%r12d    # count == 1
    jne     overif2
    movl    %ebx,%r13d  # r13d = first in seq
overif2:
    cmpl    $4,%r12d    # count == 4
    je      thefinish   # we are done
    jmp     overif3
elsepart:
    movl    $0,%r12d    # clear the count
overif3:
    incl    %ebx
    jmp     loop3
thefinish:
    movl    %r13d,%eax
    popq    %r15
    popq    %r14
    popq    %r13
    popq    %r12
    popq    %rbx   
    ret
    
    .size e47,.-e47
