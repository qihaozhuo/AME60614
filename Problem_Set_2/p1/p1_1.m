clear
clc

N=100;
G=zeros(N,N);
f=zeros(N,1);
t=zeros(N,1);
xk=zeros(N,1);
iterm=100000;
iter=0;

G(1,2)=0.5;
G(N,N-1)=0.5;
for i = 2:N-1
    G(i,i-1)=0.5;
    G(i,i+1)=0.5;
end
for i=1:N
    f(i)= 0.5*(2-2*cos(pi/(N+1)))*sin(i*pi/(N+1));
    t(i)= sin(i*pi/(N+1));
end

while (iter<iterm)
    iter=iter+1;
    xn=G*xk+f;
    xk=xn;
    ej=xk-t;
    e(iter)=max(abs(ej));
end

figure(1)
semilogy(1:iterm,e,'-','Linewidth', 3)

xlabel('Iteration')
ylabel('max |x_i-x_i^k|')
legend('Error')