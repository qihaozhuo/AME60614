% Example stability regime plots using boundary-locus method
% JF MacArt 10/20/21
close all
clear; clc; clf

x = linspace(0,2*pi,1000);
% sigma contour levels to plot
%v = [2,2];
%v = [0.8,1.0,1.2]

% Explicit Euler
%yc=sqrt((-2+cos(3*x)-4*cos(2*x)+5*cos(x)).^2+(sin(3*x)-4*sin(2*x)-5*sin(x)).^2);
yr=-2+cos(3*x)-4*cos(2*x)+5*cos(x);
yi=sin(3*x)-4*sin(2*x)-5*sin(x);
yr2=2-2*cos(x);
yt=x.^2;
plot(x,yt,'k','LineWidth',1.5); 
hold on
plot(x,yr,'r','LineWidth',1.5);
hold on
plot(x,yr2,'b','LineWidth',1.5);
set(gca,'fontsize', 16)
legend('Exact','One-sided Scheme','Central Scheme','Location','Best')
xlabel('k\Deltax')
ylabel('k^2_R\Deltax^2')
