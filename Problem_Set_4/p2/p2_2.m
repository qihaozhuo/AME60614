close all;
clear;clc;

digits(8);
N=128;
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

display(A);
e=vpa(eig(A));
ea=vpa(abs(e));
sr=vpa(max(ea)/min(ea));
display(e);
display(max(ea));
display(min(ea));
display(sr);