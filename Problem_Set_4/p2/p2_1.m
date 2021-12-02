close all;
clear;clc;

digits(8);
N=128;
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

display(A);
e=vpa(eig(A));
ea=vpa(abs(e));
sr=vpa(max(ea)/min(ea));
display(e);
display(max(ea));
display(min(ea));
display(sr);