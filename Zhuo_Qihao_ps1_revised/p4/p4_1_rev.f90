program simpson
    implicit none
    integer, parameter :: p = 4, dp=2*p
    real (kind=dp), parameter :: xmin = -1., xmax = 1.
    real (kind=dp) :: xi, fi, f0, fn, int, dx,pi
    real (kind=dp) :: exact
    integer :: n, i
   
    print *, 'Number of intervals n = ?'
    read *, n
    pi = 3.141592657_8
    dx = (xmax-xmin)/n
    f0 = 0
    fn = 0
    int = f0 + fn
    
    do i=1, n-1, 2
       xi = xmin + dx*i
       fi = cos(atanh(xi))*(exp(-((atanh(xi))**2)/2))/(sqrt(2*pi)*(1-xi**2))
       int = int + 4.0*fi
    end do
    do i=2, n-2, 2
       xi = xmin + dx*i
       fi = cos(atanh(xi))*(exp(-((atanh(xi))**2)/2))/(sqrt(2*pi)*(1-xi**2))
       int = int + 2.0*fi
    end do
    int = int*dx/3.0

    exact = exp(-0.5)
    print *, 'n = ', n, ' dx = ', dx
    print *, 'Integral = ', int, ' Exact = ', exact
    print *, 'Absolute error = ', abs(exact - int)
    print *, 'Relative error = ', abs((exact - int)/exact)
    !
    end program simpson