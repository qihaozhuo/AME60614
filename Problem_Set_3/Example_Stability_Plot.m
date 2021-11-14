% Example stability regime plots using boundary-locus method
% JF MacArt 10/20/21

clear; clc; clf

% 1D real & imaginary lambda*h
lh_real = linspace(-5,5,100);
lh_imag = linspace(-5,5,100);

% LH complex-plane matrix
[LH_real,LH_imag] = meshgrid(lh_real,lh_imag);
LH = LH_real + 1i*LH_imag;

% sigma contour levels to plot
v = [1,1];
%v = [0.8,1.0,1.2]

% Explicit Euler
sigma_EE = 1 + LH;
contour(LH_real,LH_imag,abs(sigma_EE),v,'k'); 
hold on

% Implicit Euler
sigma_IE = 1./(1 - LH);
contour(LH_real,LH_imag,abs(sigma_IE),v,'b');
hold on

% RK4
sigma_RK4 = 1 + LH + LH.^2/2.0 + LH.^3/6.0 + LH.^4/24.0;
contour(LH_real,LH_imag,abs(sigma_RK4),v,'r');

% ABM 1-corr
%   Same stability as RK2
sigma_ABM1 = 1 + 0.5*(LH + LH.*(1 + LH));
contour(LH_real,LH_imag,abs(sigma_ABM1),v,'m');

% Plot axes & legend
set(gca,'fontsize', 16)
plot(lh_real,0*lh_real,'k');
plot(0*lh_imag,lh_imag,'k');
legend('EE','IE','RK4','ABM/RK2')
xlabel('\lambda_R h')
ylabel('\lambda_I h')
