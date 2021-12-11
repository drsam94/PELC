jmp main
.origin 85
.data 100,101,103,106,110,115,121,128,136,145,155,166,178,191,205
.data 75,95,64,17,47,82,18,35,87,10,20,4,82,47,65,19,1,23,75,3,34,88,2,77,73,7,63,67,99,65,4,28,6,16,70,92,41,41,26,56,83,40,80,70,33,41,48,72,33,47,32,37,16,94,29,53,71,44,65,25,43,91,52,97,51,14,70,11,33,28,77,73,17,78,39,68,17,57,91,71,52,38,17,14,91,43,58,50,27,29,48,63,66,4,68,89,53,67,30,73,16,69,87,40,31,4,62,98,27,23,9,70,98,73,93,38,53,60,4,23

main:
    mov     $85,r3
    mov     $13,r1     
oloop:
    cmp     $0,r1
    jl      overoloop
    mov     $0,r2
    mov     r1,r0
    add     $1,r0
    mov     0(r3,r0),r4     ;; get ptr into row below
iloop:
    cmp     r2,r1
    jl      overiloop
    mov     0(r4,r2),r5     ;; elem below
    mov     r2,r0
    add     $1,r0
    mov     0(r4,r0),r15    ;; elem below and over
    cmp     r15,r5
    jl      r15big
    mov     r5,r15
r15big:
    mov     0(r3,r1),r14     ;; ptr into cur row
    add     r15,0(r14,r2)
    add     $1,r2
    jmp     iloop
overiloop:
    sub     $1,r1
    jmp     oloop
overoloop:
    mov     $100,r0
    mov     (r0),r0
    trap    $SysPutNum
    mov     $10,r0
    trap    $SysPutChar
    trap    $SysHalt
