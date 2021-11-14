close all;
clear N n x0 xN h X b u num_vcycles v u r R R1 nv1;

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

num_vcycles = 20;
e=zeros(num_vcycles,1);
for v = 1:num_vcycles
    u = mgv(u,b);
%    ej=u-t;
%    e(1)=max(abs(ej));
    for i = 1:6
        u=ud(u);
        b=bd(b);
        u=mgv(u,b);
%        tp=tpl(u);
%        ej=u-tp;
%        e(i+1)=max(abs(ej));
    end
    for j = 1:6
        u=ua(u);
        b=ba(b);
        u=mgv(u,b);
%        tp=tpl(u);
%        ej=u-tp;
%        e(i+7)=max(abs(ej));
    end
    ej=u-t;
    e(v)=norm(ej);
end


figure(1)
plot(Px,t,'-','Linewidth',2)
hold on
plot(Px,u,'-','Linewidth',2)
xlabel('x')
ylabel('u')
legend('actual valuie','multigrid method','location','northwest')

figure(2)
plot(1:num_vcycles,e,'-','Linewidth',2)