program p4_1
    implicit none
    real(kind=16) y,x,pi

    x = 5._16
    pi = 3.141592657_16
    do while (x<=50)
        y = x**4*(exp(-(x**2)/2))/(sqrt(2*pi))
        WRITE(*,*) x,y
        x=x+5
    end do
    
end program p4_1