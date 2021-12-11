.assembly extern mscorlib {}
.assembly e79 {}

.namespace E79 
{
    .method public static void main() cil managed
    {
        .entrypoint
        .maxstack 100
        .locals([0] int32[],
                [1] int32,
                [2] int32,
                [3] int32,
                [4] int32,
                [5] int32,
                [6] int32)
        ldc.i4 10
        newarr int32
        stloc.0
        ldc.i4.0
        stloc.3
        ldc.i4.0
        stloc.1
LOOP_INIT:
        ldloc.1
        ldloc.0
        ldlen
        bge OVERLOOP_INIT
        ldloc.0
        ldloc.1
        ldc.i4.0
        stelem.i4
        ldloc.1
        ldc.i4.1
        add
        stloc.1
        br LOOP_INIT
OVERLOOP_INIT:

LOOP_MAIN:
        call string [mscorlib]System.Console::ReadLine()
        dup
        brnull OVERLOOP_MAIN
        call int32 [mscorlib]System.Int32::Parse(string)
        stloc.2
        ldloc.2
        ldc.i4 100
        div
        stloc 4
        ldloc.2
        ldc.i4 10
        div
        ldc.i4 10
        rem
        stloc 5
        ldloc.2
        ldc.i4 10
        rem
        stloc 6
        ldloc.0
        ldloc 5
        ldloc.0
        ldloc 5
        ldelem.i4
        ldc.i4.1
        ldloc 4
        shl
        or
        stelem.i4
        ldloc.0
        ldloc 6
        ldloc.0
        ldloc 6
        ldelem.i4
        ldc.i4.1
        ldloc 5
        shl
        or
        ldc.i4.1
        ldloc 4
        shl
        or
        stelem.i4
        ldloc.3
        ldc.i4.1
        ldloc 4
        shl
        or
        ldc.i4.1
        ldloc 5
        shl
        or
        ldc.i4.1
        ldloc 6
        shl
        or
        stloc.3
        br LOOP_MAIN
OVERLOOP_MAIN:
        pop
        ldc.i4.0
        stloc 4
        ldc.i4.0
        stloc.1
LOOP_FINAL:
        ldloc.1
        ldc.i4 10
        bge OVERLOOP_FINAL
        ldloc.0
        ldloc.1
        ldelem.i4
        ldloc.3
        ldloc.1
        shr
        ldc.i4.1
        and
        ldc.i4.1
        xor
        or
        brzero IFPART
ELSEPART:
        ldloc.1
        ldc.i4.1
        add
        stloc.1
        br LOOP_FINAL
IFPART:
        ldloc 4
        ldc.i4 10 
        mul
        ldloc.1
        add
        stloc 4
        ldc.i4.1
        ldloc.1
        shl
        not
        ldloc.3
        and
        stloc.3
        ldc.i4.0
        stloc 5
LOOP_CLEAR:
        ldloc 5
        ldc.i4 10
        bge OVERLOOP_CLEAR
        ldloc.0
        ldloc 5
        ldloc.0
        ldloc 5
        ldelem.i4
        ldc.i4.1
        ldloc.1
        shl
        not
        and
        stelem.i4
        ldloc 5
        ldc.i4.1
        add
        stloc 5
        br LOOP_CLEAR
OVERLOOP_CLEAR:
        ldc.i4.0
        stloc.1
        br LOOP_FINAL
OVERLOOP_FINAL:
        ldloc.s 4
        call void [mscorlib]System.Console::WriteLine(int32)
        ret
    }
}
