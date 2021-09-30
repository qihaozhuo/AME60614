program simpson
    implicit none
    integer, parameter :: p = 4, dp=2*p     ! define precision
    real (kind=dp), parameter :: xmin = -10., xmax = 10. ! set values for xmin and xmax
    real (kind=dp) :: xi, fi, f0, fn, int, dx,pi
    real (kind=dp) :: exact
    integer :: n, i

    print *, 'Number of intervals n = ?'
    read *, n                               ! input # of subintervals
    pi = 3.141592657_8
    dx = (xmax-xmin)/n                      ! calculate dx
    f0 = cos(xmin)*(exp(-(xmin**2)/2))/(sqrt(2*pi))         ! function value at the left end
    fn = cos(xmax)*(exp(-(xmax**2)/2))/(sqrt(2*pi))       ! function value at the right end
    int = f0 + fn                           ! contribution from the end points
    !
    do i=1, n-1, 2                          ! loop over odd i values
       xi = xmin + dx*i                     ! calculate x_i
       fi = cos(xi)*(exp(-(xi**2)/2))/(sqrt(2*pi))          ! calculate f_i
       int = int + 4.0*fi                   ! add to the integral
    end do                                  ! end of loop
    do i=2, n-2, 2                          ! loop over even i values
       xi = xmin + dx*i                     ! calculate x_i
       fi = cos(xi)*(exp(-(xi**2)/2))/(sqrt(2*pi))          ! calculate f_i
       int = int + 2.0*fi                   ! add to the integral
    end do                                  ! end of loop
    int = int*dx/3.0

    exact = exp(-0.5)
    print *, 'n = ', n, ' dx = ', dx
    print *, 'Integral = ', int, ' Exact = ', exact
    print *, 'Absolute error = ', abs(exact - int)
    print *, 'Relative error = ', abs((exact - int)/exact)
    !
    end program simpson                     ! end of program