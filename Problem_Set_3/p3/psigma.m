% Example stability regime plots using boundary-locus method
% Modified from Prof's code

clear; clc; clf

% 1D real & imaginary lambda*h
lh_real = linspace(-10,10,100);
lh_imag = linspace(-10,10,100);

% LH complex-plane matrix
[LH_real,LH_imag] = meshgrid(lh_real,lh_imag);
LH = LH_real + 1i*LH_imag;

% sigma contour levels to plot
%v = [1,1];
%v = [0.8,1.0,1.2];

% Explicit Euler
thet=linspace(0,2*pi,1000);
sigma=exp(1i.*thet);
yc = (sigma-1./sigma)./2;
plot(real(yc),imag(yc),'--'); 
hold on

% Plot axes & legend
set(gca,'fontsize', 16)
plot(lh_real,0*lh_real,'k');
plot(0*lh_imag,lh_imag,'k');
legend('Explicit BDF2')
xlabel('\lambda_R h')
ylabel('\lambda_I h')