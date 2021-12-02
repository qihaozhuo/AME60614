close all;
clear;clc

N=[32 64 128 256 512 1024];
a=zeros(6,1);
b=zeros(6,1);

for i=1:6
    b(i)=lm1(N(i));
    a(i)=lm2(N(i));
end

a=1./a;
b=2./b;
loglog(N,a,'LineWidth',2);
hold on
loglog(N,b,'LineWidth',2);
set(gca,'fontsize', 16)
legend('Direct Derivation','Coordinate Transformation','Location','Best')
xlabel('N')
ylabel('\alpha\Deltat')

function km=lm1(N)
x=zeros(N,1);
x0=-1.0;
A=zeros(N,N);
z=zeros(N,1);
dz=10/N;
f=zeros(N,1);

for i=1:N
    x(i)=tanh(5*(i-N/2)/(N/2))/tanh(5);
    z(i)=5*(i-N/2)/(N/2);
    f(i)=1/(1-tanh(5)*tanh(5)*x(i)*x(i));
end

%for 1=1
    A(1,1)=-2*f(1)^2/dz;
    A(1,2)=f(1)^2*(1/dz+tanh(5)*x(1));
    A(1,N)=f(1)^2*(1/dz-tanh(5)*x(1));
%end

%for i=N
    A(N,1)=f(N)^2*(1/dz+tanh(5)*x(N));
    A(N,N-1)=f(N)^2*(1/dz-tanh(5)*x(N));
    A(N,N)=-2*f(N)^2/dz;
%end

for i=2:N-1
    A(i,i-1)=f(i)^2*(1/dz-tanh(5)*x(i));
    A(i,i)=-2*f(i)^2/dz;
    A(i,i+1)=f(i)^2*(1/dz+tanh(5)*x(i));
end

e=vpa(eig(A));
ea=vpa(abs(e));
km=max(ea);
end


function km=lm2(N)
x=zeros(N,1);
x0=-1.0;
A=zeros(N,N);

for i=1:N
    x(i)=tanh(5*(i-N/2)/(N/2))/tanh(5);
end

%for 1=1
    A(1,1)=-1/((x(2)-x(1))*(x(1)-x0));
    A(1,2)=1/((x(2)-x0)*(x(2)-x(1)));
    A(1,N)=1/((x(2)-x0)*(x(1)-x0));
%end

%for i=N
    A(N,1)=1/(2*(x(1)-x0)^2);
    A(N,N-1)=1/(2*(x(1)-x0)*(x(N)-x(N-1)));
    A(N,N)=-1/((x(1)-x0)*(x(N)-x(N-1)));
%end

for i=2:N-1
    A(i,i-1)=1/((x(i+1)-x(i-1))*(x(i)-x(i-1)));
    A(i,i)=-1/((x(i+1)-x(i))*(x(i)-x(i-1)));
    A(i,i+1)=1/((x(i+1)-x(i-1))*(x(i+1)-x(i)));
end

e=vpa(eig(A));
ea=vpa(abs(e));
km=max(ea);
end