.class public e90
.super java/lang/Object

.method public static printInt(I)V
    .limit stack  100
    .limit locals 100
    getstatic     java/lang/System out Ljava/io/PrintStream;
    iload_0
    invokevirtual java/io/PrintStream println (I)V
    return
.end method

.method public static sixBitsSet(I)I
    .limit stack  100
    .limit locals 100
    iconst_1
    istore_1
    iconst_0
    istore_2
BITSETLOOP:
    iload_1
    iload_0
    if_icmpgt   BITSETLOOP_END
    iload_1
    iload_0
    iand
    ifeq        NOADD
    iinc        2 1
NOADD:
    iload_1
    iconst_1
    ishl
    istore_1
    goto        BITSETLOOP
BITSETLOOP_END:
    bipush      6
    iload_2
    if_icmpeq   RETURN_TRUE
    iconst_0
    ireturn
RETURN_TRUE:
    iconst_1
    ireturn
.end method
    
.method public static setContains(II)I
    .limit stack  100
    .limit locals 100
    iconst_1
    iload_1
    ishl
    iload_0
    iand
    ifgt        RETURN_SUCCESS
    iconst_0
    ireturn
RETURN_SUCCESS:
    iconst_1
    ireturn
.end method
          
.method public static check(III)I
    .limit stack  100
    .limit locals 100
    iload_0
    invokestatic e90/sixBitsSet(I)I
    iload_1
    invokestatic e90/sixBitsSet(I)I
    iadd
    iconst_2
    if_icmpne   RETURN_FAILURE
    iload_0
    sipush      512
    iand
    ifeq        SKIP_ADDSIX1
    iload_0
    sipush      64
    ior
    istore_0
SKIP_ADDSIX1:
    iload_1
    sipush      512
    iand
    ifeq        SKIP_ADDSIX2
    iload_1
    sipush      64
    ior
    istore_1
SKIP_ADDSIX2:
    iload_2
    bipush      10
    irem
    istore_3
    iload_3
    bipush      9
    if_icmpne   SKIP_SIXIFY
    bipush      6
    istore_3
SKIP_SIXIFY:
    iload_0
    iload_3
    invokestatic e90/setContains(II)I
    istore      4
    iload_1
    iload_3
    invokestatic e90/setContains(II)I
    istore      5
    iload_2
    bipush      10
    idiv
    istore_3
    iload_3
    bipush      9
    if_icmpne   SKIP_SIXIFY2
    bipush      6
    istore      3
SKIP_SIXIFY2:
    iload_0
    iload_3
    invokestatic e90/setContains(II)I
    istore      6
    iload_1
    iload_3
    invokestatic e90/setContains(II)I
    istore      7
    iload       4
    iload       7
    iand
    iload       5
    iload       6
    iand
    ior
    ireturn
RETURN_FAILURE:
    iconst_0
    ireturn        
.end method   
              
.method public static main : ([Ljava/lang/String;)V
    .limit stack  100
    .limit locals 100
    
    iconst_0
    istore      6
    bipush      9
    newarray    int
    astore      4        
    iconst_0    
    istore_0 
INITLOOP:
    iload_0
    bipush      9
    if_icmpge    INITLOOP_END
    aload       4
    iload_0
    iinc        0 1
    iload_0
    iload_0
    imul
    iastore
    goto        INITLOOP
INITLOOP_END:
    iconst_0
    istore_0
OUTERLOOP:      
    iload_0     
    sipush      1024
    if_icmpge   OUTERLOOP_END
    iload_0     
    istore_1    
INNERLOOP:      
    iload_1     
    sipush      1024
    if_icmpge   INNERLOOP_END
    iconst_0
    istore      5
INNERMOSTLOOP:
    iload       5
    bipush      9
    if_icmpge   INNERMOSTLOOP_END_SUCCESS
    iload_0
    iload_1
    aload       4
    iload       5
    iaload
    invokestatic e90/check(III)I
    ifeq        INNERMOSTLOOP_END_FAILURE
    iinc        5 1
    goto        INNERMOSTLOOP
INNERMOSTLOOP_END_SUCCESS:
    iinc        6 1
INNERMOSTLOOP_END_FAILURE:
    iinc        1 1
    goto        INNERLOOP
INNERLOOP_END:    
    iinc        0 1
    goto        OUTERLOOP
OUTERLOOP_END:
    getstatic   java/lang/System out Ljava/io/PrintStream;
    iload       6
    invokevirtual java/io/PrintStream println (I)V  
    return       
.end method       
