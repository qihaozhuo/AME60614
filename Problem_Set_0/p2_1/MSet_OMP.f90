program MSet
use omp_lib
    implicit none
    COMPLEX(kind=8) :: c,z
    REAL(kind=8) :: xmin,xmax,ymin,ymax,dx,dy
    INTEGER(kind=8) :: nx,ny,niter,i
    INTEGER(kind=8) :: cx,cy
    REAL(kind=8) :: t_begin,t_end

    CALL cpu_time(t_begin)

    OPEN(unit=1,file='MSet.in')
    READ(1,*) xmin,xmax,nx,ymin,ymax,ny,niter
    dx = (xmax-xmin)/(nx-1)
    dy = (ymax-ymin)/(ny-1)
    c = complex(xmin,ymin)
    WRITE(*,*) c

    OPEN(unit=2,file='MSet.out')
    WRITE(*,*) xmin,xmax,nx,ymin,ymax,ny,niter
    !$OMP PARALLEL DO  PRIVATE(c,z)
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
            c = complex(real(c),aimag(c)+dy)
            WRITE(*,*) c
        end do
        c = complex(real(c)+dx,ymin)
        WRITE(*,*) c
    end do
    !$OMP END PARALLEL DO

    CALL cpu_time(t_end)

    WRITE(*,*) t_end-t_begin
    WRITE(2,*) "time", t_end-t_begin, "case", xmin,xmax,nx,ymin,ymax,ny,niter
    
end program MSet

