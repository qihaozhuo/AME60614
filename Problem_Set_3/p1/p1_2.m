% Example stability regime plots using boundary-locus method
% Modified from Prof's code
close all
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

% ABM1
sigma_ABM1 = 1 + LH + LH.^2/2.0;
contour(LH_real,LH_imag,abs(sigma_ABM1),v,'r');
hold on

% ABM2
sigma_ABM2 = 1 + LH + LH.^2/2.0 + LH.^3/4.0;
contour(LH_real,LH_imag,abs(sigma_ABM2),v,'k');
hold on

% ABM3
sigma_ABM3 = 1 + LH + LH.^2/2.0 + LH.^3/4.0 + LH.^4/8.0;
contour(LH_real,LH_imag,abs(sigma_ABM3),v,'b');
hold on

% ABM4
sigma_ABM4 = 1 + LH + LH.^2/2.0 + LH.^3/4.0 + LH.^4/8.0 + LH.^5/16.0;
contour(LH_real,LH_imag,abs(sigma_ABM4),v,'m');
hold on

% ABM5
sigma_ABM5 = 1 + LH + LH.^2/2.0 + LH.^3/4.0 + LH.^4/8.0 + LH.^5/16.0+LH.^6/32.0;
contour(LH_real,LH_imag,abs(sigma_ABM5),v,'p');
hold on

% ABM6
sigma_ABM6 = 1 + LH + LH.^2/2.0 + LH.^3/4.0 + LH.^4/8.0 + LH.^5/16.0+LH.^6/32.0+LH.^7/64.0;
contour(LH_real,LH_imag,abs(sigma_ABM6),v,'g');
hold on

% ABM7
sigma_ABM7 = 1 + LH + LH.^2/2.0 + LH.^3/4.0 + LH.^4/8.0 + LH.^5/16.0+LH.^6/32.0+LH.^7/64.0+LH.^8/128.0;
contour(LH_real,LH_imag,abs(sigma_ABM7),v,'y');
hold on
% Plot axes & legend
set(gca,'fontsize', 16)
plot(lh_real,0*lh_real,'k');
plot(0*lh_imag,lh_imag,'k');
legend('ABM1','ABM2','ABM3','ABM4','ABM5','ABM6','ABM7')
xlabel('\lambda_R h')
ylabel('\lambda_I h')
