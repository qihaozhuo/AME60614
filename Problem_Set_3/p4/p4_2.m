close all;
clear;clc

k1f=2e3;
k1b=3e-12;
k2f=20;

f =@(t,y) [-k1f*y(1)*y(4)+k1b*y(5)*y(3); -k2f*y(2)*y(3); k1f*y(1)*y(4)-k1b*y(5)*y(3)-k2f*y(2)*y(3);
    -k1f*y(1)*y(4)+k1b*y(5)*y(3)+k2f*y(2)*y(3);k1f*y(1)*y(4)-k1b*y(5)*y(3)+k2f*y(2)*y(3)];

[t1 yr]=ode45(f, [0 40], [0.75 0.23 0.01 0.01 0.0]);
[t2 ya]=ode23t(f, [0 40], [0.75 0.23 0.01 0.01 0.0]);
[t3 yb]=ode23tb(f, [0 40], [0.75 0.23 0.01 0.01 0.0]);

figure(1);
loglog(t1,yr(:,1),'k');
hold on
loglog(t2,ya(:,1),'r');
hold on
loglog(t3,yb(:,1),'b');
hold on
legend('RK4','AM','BDF')

figure(2);
loglog(t1,yr(:,2),'k');
hold on
loglog(t2,ya(:,2),'r');
hold on
loglog(t3,yb(:,2),'b');
hold on
legend('RK4','AM','BDF')

figure(3);
loglog(t1,yr(:,3),'k');
hold on
loglog(t2,ya(:,3),'r');
hold on
loglog(t3,yb(:,3),'b');
hold on
legend('RK4','AM','BDF')

figure(4);
loglog(t1,yr(:,4),'k');
hold on
loglog(t2,ya(:,4),'r');
hold on
loglog(t3,yb(:,4),'b');
hold on
legend('RK4','AM','BDF')

figure(5);
loglog(t1,yr(:,5),'k');
hold on
loglog(t2,ya(:,5),'r');
hold on
loglog(t3,yb(:,5),'b');
hold on
legend('RK4','AM','BDF')