program p2_2
    implicit none
    real(kind=8):: dx1,dx2,dx3,dx4,x,dfa,df0,df1,df2,df3
    REAL(kind=8),external :: fx
    REAL(kind=8),external :: df

    x=1._8
    dx1=0.25_8
    dx2=0.125_8
    dx3=0.0625_8
    dx4=0.03125_8
    dfa = -2*x*exp(-x**2)
    df0 = df(x,dx1)
    df1 = df(x,dx1)*16/15-df(x,dx2)/15
    df2 = df(x,dx1)*1024/945-df(x,dx2)*16/189+df(x,dx3)/945
    df3 = df(x,dx1)*724762624/665713083-df(x,dx2)*385839104/4279584105+df(x,dx3)*1251248/855916821-df(x,dx4)*149297/29957088735
    WRITE(*,*) dfa, df0, dfa-df0
    WRITE(*,*) df1,dfa-df1
    WRITE(*,*) df2,dfa-df2
    WRITE(*,*) df3,dfa-df3

end program p2_2

real(kind=8) function fx(x)
    implicit none
    real(kind=8) :: x

    fx = exp(-x**2)
    RETURN
end

real(kind=8) function df(x,dx)
    implicit none
    real(kind=8) :: x,dx
    REAL(kind=8),external :: fx
    df = (fx(x-2*dx)-8*fx(x-dx)+8*fx(x+dx)-fx(x+2*dx))/(12*dx)
    RETURN
end