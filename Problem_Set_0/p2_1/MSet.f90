program MSet
    implicit none
    COMPLEX(kind=8) :: c,z
    REAL(kind=8) :: xmin,xmax,ymin,ymax,dx,dy
    INTEGER(kind=8) :: nx,ny,niter,i
    REAL(kind=8) :: t_begin,t_end

    CALL cpu_time(t_begin)

    OPEN(unit=1,file='MSet.in')
    READ(1,*) xmin,xmax,nx,ymin,ymax,ny,niter
    dx = (xmax-xmin)/(nx-1)
    dy = (ymax-ymin)/(ny-1)
    c = complex(xmin,ymin)
    WRITE(*,*) c

    OPEN(unit=2,file='MSet.out')
    do while (real(c)<=0.5)
        do while (aimag(c)<=2)
            z = (0,0)
            i = 1
            do while (abs(z)<=2 .AND. i<=niter)
                z = z**2 + c
                i = i + 1
            end do
            if ( i >= niter ) then
               WRITE(2,*) real(c), AIMAG(c)
            end if
            c = complex(real(c),aimag(c)+dy)
            WRITE(*,*) c
        end do
        c = complex(real(c)+dx,ymin)
        WRITE(*,*) c
    end do
    
    CALL cpu_time(t_end)

    WRITE(*,*) t_begin-t_end
    WRITE(2,*) "time", t_begin-t_end
    
end program MSet

