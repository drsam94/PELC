
    b       main
isPrime:
    cmp     r0,#2
    blt     finif
    beq     finit
    tst     r0,#1
    beq     finif
    mov     r1,#3
loop:
    mul     r2,r1,r1
    cmp     r2,r0
    bgt     finit
    div     r2,r0,r1
    mul     r2,r2,r1
    cmp     r2,r0
    beq     finif
    add     r1,r1,#2
    b       loop
finif:
    mov     r0,#0
    mov     pc, lr
finit:
    mov     r1,#0
    mov     pc, lr

main:
    mov     v1,#1  ;; level
    mov     v3,#0  ;; primes
loop2:
    mov     v2,#1  ;; index in level
loop3:
    cmp     v2,#4
    bge     overloop3
    mul     r0,v1,#2
    sub     r0,r0,#1
    mul     r0,r0,r0
    mul     v4,v1,v2, lsl #1
    add     r0,r0,v4 ;; finished computation
    bl      isPrime
    cmp     r0,#0
    addne   v3,v3,#1
    add     v2,v2,#1
    b       loop3
overloop3:
    mul     v4,v1,v2
    add     v4,v4,#1
    div     r0,v4,v3
    cmp     r0,#10
    bge     overloop2
    add     v1,v1,#1
    b       loop2
overloop2:
    mov     r0,v1, lsl #1 
    add     r0,r0,#1
    swi     #SysPutNum
    mov     r0,#10
    swi     #SysPutChar
    swi     #SysHalt 
