program MSet
    use omp_lib
    implicit none
    COMPLEX(kind=8) :: c,z
    REAL(kind=8) :: xmin,xmax,ymin,ymax,dx,dy
    INTEGER(kind=8) :: nx,ny,niter,i
    INTEGER(kind=8) :: cx,cy,j,k
    REAL(kind=8) :: t_begin,t_end,t_middle
    integer(kind=8),dimension(:,:),allocatable :: MS

    t_begin = omp_get_wtime()
    allocate (MS (10000,10000))
    MS = 0
    OPEN(unit=1,file='MSet.in')
    READ(1,*) xmin,xmax,nx,ymin,ymax,ny,niter
    dx = (xmax-xmin)/(nx-1)
    dy = (ymax-ymin)/(ny-1)
    c = complex(xmin,ymin)
    !WRITE(*,*) c

    OPEN(unit=2,file='Int.out')
    !WRITE(*,*) xmin,xmax,nx,ymin,ymax,ny,niter
    
    
    !$OMP PARALLEL DO SCHEDULE(guided) SHARED(MS) PRIVATE(cx,cy,i,c,z)
    do cx=1,nx-1
        do cy=1,ny-1
            z = (0,0)
            i = 1
            do while (abs(z)<=2 .AND. i<=niter)
                z = z**2 + c
                i = i + 1
            end do
            if ( i >= niter ) then
                MS(cx,cy) = 1
               !WRITE(2,*) real(c), AIMAG(c)
            end if
            c = complex(real(c),ymin+cy*dy)
            !WRITE(*,*) c
        end do
        c = complex(xmin+cx*dx,ymin)
        !WRITE(*,*) c
    end do
    !$OMP END PARALLEL DO
    
    t_middle = omp_get_wtime()

    do j = 1, 10000
        do k = 1, 10000
            if ( MS(j,k) /= 0 ) then
                WRITE(2,*) xmin+j*dx, ymin+k*dy
            end if
        end do
    end do

    t_end = omp_get_wtime()
    WRITE(*,*) "time", t_end-t_begin, t_middle-t_begin, t_end-t_middle
    WRITE(*,*) "case", xmin,xmax,nx,ymin,ymax,ny,niter 

end program MSet