clear
clc

tic

nx=500;
ny=500;
dx=2.5/(nx-1);
dy=4.0/(ny-1);
Re_plot = -2:dx:0.5;
Im_plot = -2:dy:2;

hold on

%f1 = fopen('exp.txt','w');
for Re = Re_plot
    for Im = Im_plot
        c_p = Re + Im*1i;
        if(ms_check(c_p, 10))
            plot(Re, Im, 'r.');
            %fprintf(f1,'%6.2f %6.2f\n',real(c_p),imag(c_p));
        end
    end
end
%fclose(f1);

toc

function [logi] = ms_check(c, niter)
z=0;
count=0;
while abs(z) < 2 && count < niter
    z = z^2 + c;
    count=count+1;
end
if count == niter
    logi=true;
else
    logi=false;
end
end

