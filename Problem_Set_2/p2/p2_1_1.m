clear
clc

n=255;
N=n+2;
x0 = 0;
xN = 1;
dx = (xN-x0)/(n+1);
b=zeros(n,1);
t=zeros(N,1);
u=zeros(N,1);
iter=0;
Px=zeros(n,1);
u(1)=1;
u(N)=3;
for i=1:n
    Px(i)=x0+i*dx;
    b(i)=-20.0+0.5*120*pi*Px(i)*cos(20*pi*Px(i)^3)-0.5*3600*pi*pi*Px(i)^4*sin(20*pi*Px(i)^3);
    u(i+1)=1.0+2.0*Px(i);
end
uk=u;

while (iter<1000)
    iter=iter+1;
    for i=2:N-1
        uk(i)=0.5*(u(i-1)+u(i+1))-0.5*dx*dx*b(i-1);
    end
    u=uk;
    if (iter==20)
        u1=uk;
    end
    if (iter==100)
        u2=uk;
    end
    if (iter==1000)
        u3=uk;
    end
end
t(1)=1;
t(N)=3;
for i=2:N-1
    t(i)=1+12*Px(i-1)-10*Px(i-1)^2+0.5*sin(20*pi*Px(i-1)^3);
end