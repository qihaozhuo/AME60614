clear
clc

x=1;
h=[0.5;0.25;0.1;0.05;0.025];
e1=zeros(length(h),1);
e2=zeros(length(h),1);
e3=zeros(length(h),1);
e4=zeros(length(h),1);
dfe=-2*x*exp(-x^2);

for i=1:length(h)
    d1=dfx(x,h(i));
    d2=dfx(x,h(i)/2);
    d3=dfx(x,h(i)/4);
    d4=dfx(x,h(i)/8);
    d12=(16*d2-d1)/15;
    d23=(16*d3-d2)/15;
    d123=(64*d23-d12)/63;
    d34=(16*d4-d3)/15;
    d234=(64*d34-d23)/63;
    d1234=(256*d234-d123)/255;
    e1(i)=abs(d1-dfe);
    e2(i)=abs(d12-dfe);
    e3(i)=abs(d123-dfe);
    e4(i)=abs(d1234-dfe);
end

p1=polyfit(log(h),log(e1),1);
disp(p1);
p2=polyfit(log(h),log(e2),1);
disp(p2);
p3=polyfit(log(h),log(e3),1);
disp(p3);
p4=polyfit(log(h),log(e4),1);
disp(p4);

loglog(h,e1,'-o','Linewidth',2)
hold on
loglog(h,e2,'-o','Linewidth',2)
hold on
loglog(h,e3,'-o','Linewidth',2)
hold on
loglog(h,e4,'-o','Linewidth',2)
legend('D1','D12','D123','D1234')

function fx=fx(x)
fx=exp(-x^2);
end

function dfx=dfx(x,dx)
dfx=(fx(x-2*dx)-8*fx(x-dx)+8*fx(x+dx)-fx(x+2*dx))/(12*dx);
end
