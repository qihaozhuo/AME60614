program MSet
    implicit none
    COMPLEX(kind=8) :: c,z
    REAL(kind=8) :: xmin,xmax,ymin,ymax,dx,dy
    INTEGER(kind=8) :: nx,ny,niter,i
    INTEGER(kind=8) :: cx,cy
    REAL(kind=8) :: t_begin,t_end

    OPEN(unit=1,file='MSet.in')
    READ(1,*) xmin,xmax,nx,ymin,ymax,ny,niter
    dx = (xmax-xmin)/(nx-1)
    dy = (ymax-ymin)/(ny-1)
    c = complex(xmin,ymin)

    OPEN(unit=2,file='dyIntMSet.out')
    
    CALL cpu_time(t_begin)
    do cx=1,nx-1
        do cy=1,ny-1
            z = (0,0)
            i = 1
            do while (abs(z)<=2 .AND. i<=niter)
                z = z**2 + c
                i = i + 1
            end do
            if ( i >= niter ) then
               WRITE(2,*) real(c), AIMAG(c)
            end if
            c = complex(real(c),ymin+cy*dy)
        end do
        c = complex(xmin+cx*dx,ymin)
    end do
    
    CALL cpu_time(t_end)

    WRITE(*,*) "time", t_end-t_begin, "case", xmin,xmax,nx,ymin,ymax,ny,niter

end program MSet

