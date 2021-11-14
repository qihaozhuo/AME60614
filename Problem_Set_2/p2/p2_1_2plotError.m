clear
clc

N=255;
x0 = 0;
xN = 1;
dx = (xN-x0)/(N+1);
G=zeros(N+2,N);
f=zeros(N+2,1);
t=zeros(N+2,1);
u=zeros(N+2,1);
iter=0;
Px=zeros(N+2,1);
Px(1)=0;
Px(N+2)=1;
f(1)=0;
f(N+2)=0;
u(1)=1;
u(N+2)=3;
for i=2:N+1
    Px(i)=x0+(i-1)*dx;
    f(i)=-20+0.5*120*pi*Px(i)*cos(20*pi*Px(i)^3)-0.5*3600*pi*pi*Px(i)^4*sin(20*pi*Px(i)^3);
    u(i)=1+2*Px(i);
end
uk=u;
u0=uk;

t(1)=1;
t(N+2)=3;
for i=2:N+1
    t(i)=1+12*Px(i)-10*Px(i)^2+0.5*sin(20*pi*Px(i)^3);
end
G(1,1)=1;
G(N+2,N+2)=1;
for i = 2:N+1
    G(i,i-1)=0.5;
    G(i,i+1)=0.5;
end

while (iter<100000)
    iter=iter+1;
    un=G*uk-0.5*dx*dx*f;
    uk=un;
    ej=uk-t;
    e(iter)=max(abs(ej));
    en(iter)=norm(ej);
end
u=uk;

figure(1)
semilogy(1:iter,e,'-','Linewidth',2)
xlabel('iteration')
ylabel('e_k')
legend('error')

figure(2)
semilogy(1:iter,en,'-','Linewidth',2)