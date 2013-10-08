!Program 
program euler
implicit none
integer :: N, ans
N = 600851475143
!N = 13195
ans = 0
call bigpfac(N, ans)
print *, ans
end program euler

subroutine isprime(x, output)
implicit none
integer :: i, x, output
output = 1

do i=2, int(sqrt(real(x)))
if (mod(x,i) == 0) then
    output = 0
exit
end if
end do
end subroutine isprime

subroutine bigpfac(x, output)
implicit none
integer :: i, x, output, p
output = 0
do i=3,x,2
    call isprime(i, p)
    if (x == 1) then
        exit
    end if
    if ((p == 1) .and. (mod(x,i) == 0)) then
        output = i
        x = x / i
    end if
end do
end subroutine bigpfac
 


