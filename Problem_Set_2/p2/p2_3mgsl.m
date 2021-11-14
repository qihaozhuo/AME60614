close all;
clear N n x0 xN h X b u num_vcycles v u r R R1 nv1 e ej;

N = 256;
n = N+1;
x0 = 0;
xN = 1;
h = 1/N;
b=zeros(N+1,1);
u=zeros(N+1,1);
%X = linspace(x0,xN,N+1)';
Px=zeros(N+1,1);
for i=1:N+1
    Px(i)=x0+(i-1)*h;
    b(i)=-20+0.5*120*pi*Px(i)*cos(20*pi*Px(i)^3)-0.5*3600*pi*pi*Px(i)^4*sin(20*pi*Px(i)^3);
    u(i)=1+2*Px(i);
end
t=zeros(N+1,1);
t(1)=1;
t(N+1)=3;
for i=2:N
    t(i)=1+12*Px(i)-10*Px(i)^2+0.5*sin(20*pi*Px(i)^3);
end
%u=u(:);
%b = -20+0.5.*120.*pi.*X.*cos(20.*pi.*X.^3)-0.5.*3600.*pi.*pi.*X.^4.*sin(20.*pi.*X.^3);
%uk=1+2*X;
%u = uk(:);

num_vcycles = 5;
for v = 1:num_vcycles
    u = mgvsl(u,b,5);
    r=zeros(n,1);
    r=u-t;
    %r(2:n-1)=b(2:n-1)+(2*u(2:n-1)-u(1:n-2)-u(3:n))/h^2;
    R(v)=max(abs(r));
    %R(v)=norm(r);
end
%disp(polyfit(1:25,R(1:25),1));

figure(1)
plot(Px,t,'-','Linewidth',2)
hold on
plot(Px,u,'-','Linewidth',2)
xlabel('x')
ylabel('u')
legend('actual valuie','multigrid method','location','northwest')

figure(2)
semilogy(1:num_vcycles,R,'-','Linewidth',2)
xlabel('Vcycles')
ylabel('e_k')