close all;
clear; clc; clf

h = 0.01;
w = 0.1;
wn = 25;
Tmax = 100;

fx = @(t) -cos(5*t)/50.0+cos(0.1*t)/50;
fu = @(t) sin(5*t)/10 - sin(5*t)/500;
T = linspace(0,100,10000);
%Exact value
xtr=fx(T);
utr=fu(T);

%Explicit Euler
Xe = [0;0];
Te = 0;
i = 1;
A = [1 h; -wn*h 1];
while (Te(i) <= Tmax )
    Xe(:,i+1) = A*Xe(:,i)+[0;h*cos(Te(i)/10.0)];
    Te(i+1) = Te(i)+h;
    i = i+1;
end
%Sympletic Euler
Xi = [0;0];
Ti = 0;
i = 1;
B = [1 0; wn*h 1];
C = [1 h;0 1];
while (Ti(i) <= Tmax )
    Xi(:,i+1) = B\(C*Xi(:,i)+[0;h*cos(Ti(i)/10.0)]);
    Ti(i+1) = Ti(i)+h;
    i = i+1;
end
%RK4
g=@(t,y) [y(2);-25*y(1)+cos(0.1*t)];
[tr y4]=rk4(g,[0,100],[0,0]',10000);

%error
Xt=[xtr;utr];
Xe(:,10001)=[];
Xi(:,10001)=[];
y4(:,10001)=[];
Te(:,10001)=[];
Ti(:,10001)=[];
tr(:,10001)=[];

%iXe=(Xe-Xt).^2.*0.001;
Xi=(Xi-Xt).^2.*0.001;
y4=(y4-Xt).^2.*0.001;

%e1=zeros(2,10000);
e2=zeros(2,10000);
e3=zeros(2,10000);
%e1(:,1)=Xe(:,1);
e2(:,1)=Xi(:,1);
e3(:,1)=y4(:,1);
for i=2:10000
    for j=1:i
       %e1(:,i)=e1(:,i)+Xe(:,j); 
       e2(:,i)=e2(:,i)+Xi(:,j); 
       e3(:,i)=e3(:,i)+y4(:,j); 
       j=j+1;
    end
    i=i+1;
end

%e1=sqrt(e1);
e2=sqrt(e2);
e3=sqrt(e3);

%plot
figure(1);clf
%plot(T,Xt(1,:),'k')
%plot(Xt(1,:),Xt(2,:),'k')
%hold on
%semilogy(Te,e1(1,:),'r-.')
%plot(Xe(1,:),Xe(2,:),'r-.')
%hold on
semilogy(Ti,e2(1,:),'g-')
hold on
semilogy(tr,e3(1,:),'b--')
hold on
%plot(Xi(1,:),Xi(2,:),'g-')
%plot(y4(1,:),y4(2,:),'b--')

%axis([0 100 -0.8 0.8])
xlabel('x(t)')
ylabel('u(t)')
%legend('Exact Value','Foward Euler')
legend('Sympletic Euler','RK4')

function [t,y] = rk4(f,tspan,y0,N)
% Fourth-order Runge-Kutta

m = length(y0);
t = linspace(tspan(1),tspan(2),N+1);
y = zeros(m,N+1);
h = (tspan(2)-tspan(1))/N;
y(:,1) = y0;

for i = 1:N
    k1 = h*f(t(i),y(:,i));
    k2 = h*f(t(i)+h/2,y(:,i)+k1/2);
    k3 = h*f(t(i)+h/2,y(:,i)+k2/2);
    k4 = h*f(t(i)+h,y(:,i)+k3);
    y(:,i+1) = y(:,i) + k1/6 + (k2+k3)/3 + k4/6;
end
end