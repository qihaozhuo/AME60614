function b=ba(uk)
n=length(uk);
N=(n-1)*2+1;

x0 = 0;
xN = 1;
h = 1/(N-1);
b=zeros(N,1);
Px=zeros(N,1);
for i=1:N
    Px(i)=x0+(i-1)*h;
    b(i)=-20+0.5*120*pi*Px(i)*cos(20*pi*Px(i)^3)-0.5*3600*pi*pi*Px(i)^4*sin(20*pi*Px(i)^3);
end

end