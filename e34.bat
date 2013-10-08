@echo off
goto main

rem  *I originally wrote this factorial method, but it
rem  *is slower than the lookup method, which is plenty
rem  *suitable for the needs of this problem
:factorialreal
set /a counter=1
set /a result=0
:loop1
    set /a test=input+1
    if "%counter%"=="%test%" (
        goto end
    ) else (
        set /a result*=%counter%
    )
    set /a counter+=1
    goto loop1
:end1
goto aftercall

:factorial
if %input%==0 (
    set /a result=1
) else if %input%==1 (
    set /a result=1
) else if %input%==2 (
    set /a result=2
) else if %input%==3 (
    set /a result=6
) else if %input%==4 (
    set /a result=24
) else if %input%==5 (
    set /a result=120
) else if %input%==6 (
    set /a result=720
) else if %input%==7 (
    set /a result=5040
) else if %input%==8 (
    set /a result=40320
) else (
    set /a result=362880
)
goto aftercall
:main

rem  *we check all possible sums of factorials with reasonable digit
rem  *frequencies and see if these sums are the sums of the factorials
rem  *of their digits. This is really big and sloppy...but oh well,
rem  *and the brute-force method (check all numbers from 1 to an upperbound,
rem  *see if that number is the sum of the factorial of its digits) was
rem  *far too slow

set /a test=0
set /a answer=0
set /a c1=0
:loop-01
 set /a c2=0
  :loop-2
   set /a c3=0
    :loop-3
     set /a c4=0
      :loop-4
       set /a c5=0
        :loop-5
         set /a c6=0
          :loop-6
           set /a c7=0
            :loop-7             
             set /a c8=0
              :loop-8               
               set /a c9=0
                :loop-9
                 set /a test+=c1
                 set /a test+=c2*2
                 set /a test+=c3*6
                 set /a test+=c4*24
                 set /a test+=c5*120
                 set /a test+=c6*720
                 set /a test+=c7*5040
                 set /a test+=c8*40320
                 set /a test+=c9*362880
                 set /a j=test
                 set /a digifacsum=0
                 :testloop
                  if %digifacsum% GTR %test% (
                   goto endtest
                  )
                  if %j%==0 (
                   goto endtest
                  )
                  set /a input=j %% 10
                  set /a j/=10
                  goto factorial
                  :aftercall
                  set /a digifacsum+=result
                  goto testloop
                 :endtest
                 if %test% GTR 10 (
                  if %digifacsum%==%test% (
                     set /a answer+=test
                  )
                 )
                 set /a test=0
                 if not %c9%==0 (
                  set /a c9+=1
                  goto loop-9
                 )
                :end9
               if not %c8%==1 (
                set /a c8+=1
                goto loop-8
               )
              :end8
             if not %c7%==1 (
              set /a c7+=1
              goto loop-7
             )
            :end7
           if not %c6%==1 (
            set /a c6+=1
            goto loop-6
           )
          :end6
         if not %c5%==2 (
          set /a c5+=1
          goto loop-5
         )
        :end5
       if not %c4%==3 (
        set /a c4+=1
        goto loop-4
       )
      :end4
     if not %c3%==3 (
      set /a c3+=1
      goto loop-3
     )
    :end3
   if not %c2%==2 (
    set /a c2+=1
    goto loop-2
   )
  :end2
 if not %c1%==2 (
  set /a c1+=1
  goto loop-01
 )
:end01
echo %answer%