clear
clc

grid=[10;100;500;1000;5000;10000];
e1=zeros(length(grid),1);
e2=zeros(length(grid),1);
e3=zeros(length(grid),1);
for i=1:length(grid)
    fh=vie(grid(i));
    fh2=vie(2*grid(i));
    e1(i)=abs(fh(xi(0.2,grid(i)))-fh2(xi(0.2,2*grid(i))));
    e2(i)=abs(fh(xi(0.5,grid(i)))-fh2(xi(0.5,2*grid(i))));
    e3(i)=abs(fh(xi(1.0,grid(i)))-fh2(xi(1.0,2*grid(i))));
end

p1=polyfit(log(grid),log(e1),1);
disp(p1);

figure(1)
loglog(grid,e1,'-o','Linewidth',2)
hold on
loglog(grid,e2,'-o','Linewidth',2)
hold on
loglog(grid,e3,'-o','Linewidth',2)
legend('x=0.2','x=0.5','x=1.0')
xlabel('N')
ylabel('|error|')


x=zeros(10001,1);
for i=1:10001
    x(i)=(i-1)/10000;
end
y=vie(10000);
figure(2)
plot(x,y,'-','Linewidth',2)
xlabel('x')
ylabel('f(x)')

function xi=xi(x,n)
d=1/n;
xi=x/d+1;
end

function f=vie(n)
syms h;
xmin=0;
!xmax=1;
!n=10;
N=n+1;
dx=1/n;
g=ones(N,1);
M = zeros(N,N);
for i = 1:N
    x=xmin + (i-1)*dx;
    g(i) = exp(-x^2)*cos(2*pi*x);
end

M(1,1)=1;

for i = 2:N
    for j=1:N
        x=xmin+(i-1)*dx;
        t=xmin +(j-1)*dx;
        if j==1
            M(i,j) = ((x-t)^2)*dx/2;
        end
        if j~=1 && j < i
            M(i,j) = ((x-t)^2)*dx;
        end
        if i==j
            M(i,j) = 1+((x-t)^2)*dx/2;
        end
    end
end
f = linsolve(M,g);
end

