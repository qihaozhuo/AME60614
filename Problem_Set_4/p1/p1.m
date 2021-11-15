% Example stability regime plots using boundary-locus method
% JF MacArt 10/20/21
close all
clear; clc; clf

x = logspace(-5,2,10000);
% sigma contour levels to plot
%v = [2,2];
%v = [0.8,1.0,1.2]

% Explicit Euler
y=sqrt((-2+cos(3*x)-4*cos(2*x)+5*cos(x)).^2+(sin(3*x)-4*sin(2*x)-5*sin(x)).^2);
semilogx(x,y,'k'); 
hold on
