close all;
clear; clc; clf


thet=linspace(0,2*pi,10000);
sigma=exp(1i.*thet);
yc = (1i*sin(thet));
plot(real(yc),imag(yc),'r-'); 
hold on
legend('EBDF3')
xlabel('\lambda_R h')
ylabel('\lambda_I h')