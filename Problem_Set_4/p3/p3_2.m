close all;
clear;clc;
%discretization
digits(16);
N=512;
NS=N*N;
NS1=N*(N-1);
%grid
L = 2*pi;
dx = 2*pi/N;
dt = 0.05;
tmax=20*pi;
cx=dt/(4*dx);
cy=dt/(2*dx);
X=zeros(N,1);
Y=zeros(N,1);
for i=1:N
    X(i)=i*dx;
    Y(i)=i*dx;
end
%initial condition
u=zeros(NS,1);
for i=1:N
    for j=1:N
        if X(i)<1 && Y(j)<1
            u(N*(j-1)+i)=exp(1/((X(i)-pi)^2-1))*exp(1/((Y(j)-pi)^2-1));
        end
    end
end
uo=u;
%initial energy
E1=vpa(u.^2);
e0=vpa(sum(E1,"all")/(4*pi*pi));
%coefficient matrix for n+1 time
A = gallery('tridiag',NS,-cy,1,cy);
for i=N+1:NS
    A(i-N,i)=cx;
    A(i,i-N)=-cx;
end
for i=NS1+1:NS
    A(i-NS1,i)=-cx;
    A(i,i-NS1)=cx;
end
for i=1:N
    A(N*(i-1)+1,N*i)=-cy;
    A(N*i,N*(i-1)+1)=cy;
end
%coefficient matrix for n time
B = gallery('tridiag',NS,cy,1,-cy);
for i=N+1:NS
    B(i-N,i)=-cx;
    B(i,i-N)=cx;
end
for i=NS1+1:NS
    B(i-NS1,i)=cx;
    B(i,i-NS1)=-cx;
end
for i=1:N
    B(N*(i-1)+1,N*i)=cy;
    B(N*i,N*(i-1)+1)=-cy;
end
tic
%solve for time advance
t=0;
while t<tmax
    b=B*uo;
    u=mldivide(A,b);
    uo=u;
    t=t+dt;
end
%energy at end
E2=vpa(u.^2);
ee=vpa(sum(E2,"all")/(4*pi*pi));
%ratio calculation
ra=vpa(ee/e0);

toc

disp(e0)
disp(ee)
disp(ra)
disp(num2str(toc))
%A = A + diag(vp1,512) + diag(vn1,-512) + diag(vn2,512*511) + diag(vp1,-512*511);
%u=zeros(N,N);

%for i=1:512
%    for j=1:512
%        if X(i)<1 && Y(j)<1
%            u(i,j)=exp(1/((X(i)-pi)^2-1))*exp(1/((Y(j)-pi)^2-1));
%        end
%    end
%end