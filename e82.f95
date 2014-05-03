!Program
program euler
implicit none
integer, dimension(80, 80) :: original, updated
integer :: row, col, changed, ans
!Commas replaced with spaces in matrix.txt
open(unit = 11, file="matrix.txt")
do row = 1,80
    read(11,*) (original(row, col),col=1,80)
end do
do row= 1,80
    updated(row, 1) = original(row, 1)
end do
do col = 2,80
    do row = 1,80
        updated(row, col) = original(row,col) + updated(row, col-1)
    end do
    changed = 1
    do while (changed .eq. 1)
        changed = 0
        do row = 1,80
            if (row > 1) then
                if (updated(row-1,col) < updated(row,col) - original(row,col)) then
                    updated(row,col) = original(row,col) + updated(row-1,col)
                    changed = 1
                end if
            end if
            if (row < 80) then
                if (updated(row+1,col) < updated(row,col) - original(row,col)) then
                    updated(row,col) = original(row,col) + updated(row+1,col)
                    changed = 1
                end if
            end if
        end do
    end do
end do
ans = 10000000
do row = 1,80
    if ( updated(row, 80) < ans) then 
        ans = updated(row, 80)
    end if
end do
print *, ans
end program euler

