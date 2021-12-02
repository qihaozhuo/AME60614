close all;
clear;clc
L = 2*pi;
dx = 2*pi/512;
dt = 2*dx/3;

tic

digits(8);
X=zeros(512,1);
Y=zeros(512,1);
N = 512;
for i=1:512
    X(i)=i*dx;
    Y(i)=i*dx;
end

B = gallery('tridiag',512,-1,0,1);
B(1,512)=-1;
B(512,1)=1;

u=zeros(N,N);

for i=1:512
    for j=1:512
        if X(i)<1 && Y(j)<1
            u(i,j)=exp(1/((X(i)-pi)^2-1))*exp(1/((Y(j)-pi)^2-1));
        end
    end
end

E1=vpa(u.^2);
e0=vpa(sum(E1,"all")/(4*pi*pi));

f = @(u) [0; -(1/(2*dx)).*(u*B)-(1/dx).*(B*u)];

% reset initial condition
%u = exp(-200*(X-0.25).^2);
%u(1) = 0;

t_final = 20*pi;
time = 0:dt:t_final;

for t = time
    % time advancement
    u1 = dt.*f(u);
    u2 = dt.*f(u+u1/2);
    u3 = dt.*f(u+u2/2);
    u4 = dt.*f(u+u3);
    u = u + (u1 + 2*u2 + 2*u3 + u4)./6;
end

E2=vpa(u.^2);
ee=vpa(sum(E2,"all")/(4*pi*pi));

ra=vpa(ee/e0);

toc

disp(e0)
disp(ee)
disp(ra)
disp(num2str(toc))