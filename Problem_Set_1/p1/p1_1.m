clear
clc

syms h a b c d e x1 x2 x3 x4 x5;
a=-2*h;
b=-h;
c=0;
d=h;
e=2*h;

A = [1 1 1 1 1;a b c d e;a^2/2 b^2/2 c^2/2 d^2/2 e^2/2;
    a^3/6 b^3/6 c^3/6 d^3/6 e^3/6;a^4/24 b^4/24 c^4/24 d^4/24 e^4/24];
B1 = [0;0;1;0;0];
B2 = [0;0;0;0;1];
B3 = [0;-3;0;1;0];
X1 = linsolve(A,B1);
X2 = linsolve(A,B2);
X3 = linsolve(A,B3);
T5 = [a^5/120 b^5/120 c^5/120 d^5/120 e^5/120];
T6 = [a^6/720 b^6/720 c^6/720 d^6/720 e^6/720];
disp(X1)
disp(T5*X1)
disp(T6*X1)
disp(X2)
disp(T5*X2)
disp(T6*X2)
disp(X3)
disp(T5*X3)
disp(T6*X3)