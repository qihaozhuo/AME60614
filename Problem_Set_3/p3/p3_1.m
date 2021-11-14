% Example stability regime plots using boundary-locus method
% Modified from Prof's code
close all;
clear; clc; clf

% 1D real & imaginary lambda*h
lh_real = linspace(-5,5,100);
lh_imag = linspace(-5,5,100);

% LH complex-plane matrix
[LH_real,LH_imag] = meshgrid(lh_real,lh_imag);
LH = LH_real + 1i*LH_imag;

% sigma contour levels to plot
v = [1,1];
%v = [0.8,1.0,1.2];

% Implicit RK2
sigma_IRK2 = (1+LH./2-LH.^2/12)/(1-LH/.2-LH.^2/12);
contour(LH_real,LH_imag,abs(sigma_IRK2),v,'r'); 
hold on

% Plot axes & legend
set(gca,'fontsize', 16)
plot(lh_real,0*lh_real,'k');
plot(0*lh_imag,lh_imag,'k');
legend('IRK2')
xlabel('\lambda_R h')
ylabel('\lambda_I h')