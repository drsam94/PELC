!Program
program euler
implicit none
integer :: x,y
integer :: output
x = 40
y = 20
call nCr(x, y, output)
!doesnt actually work
print *, 37 * 31 * 29 * 7 * 26 * 5 * 6 * 23 * 11 * 3

end program euler

subroutine nCr(n, r, output)
implicit none
integer :: n, r
integer :: a,b,c
integer :: output, temp
call topfac(n, r+1, a)
call fac(r, b)
output = a / b
end subroutine nCr

subroutine fac(input, output)
implicit none
integer :: input
integer :: output
integer :: i
output = 1

do i=1,input
    output = output * i
end do
end subroutine fac

subroutine topfac(top, bottom, output)
implicit none
integer :: top, bottom, i
integer :: output
output = 1

do i=bottom, top
    output = output * i
end do
end subroutine topfac
