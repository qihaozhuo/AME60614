clear
clc

syms h a b c d e f x1 x2 x3 x4 x5 x6;
a=-h;
b=0;
c=h;
d=-h;
e=0;
f=h;

A = [1 1 1 0 0 0;a b c 1 1 1;a^2/2 b^2/2 c^2/2 d e f;
    a^3/6 b^3/6 c^3/6 d^2/2 e^2/2 f^2/2;a^4/24 b^4/24 c^4/24 d^3/6 e^3/6 f^3/6;
    a^5/120 b^5/120 c^5/120 d^4/24 e^4/24 f^4/24];
B1 = [0;0;1;0;0;0];
B2 = [0;0;0;0;1;0];
B3 = [0;-3;0;1;0;0];
X1 = linsolve(A,B1);
X2 = linsolve(A,B2);
X3 = linsolve(A,B3);
T6 = [a^6/720 b^6/720 c^6/720 d^5/120 e^5/120 f^5/120];
T7 = [a^7/5040 b^7/5040 c^7/5040 d^6/720 e^6/720 f^6/720];
disp(X1)
disp(T6*X1)
disp(T7*X1)
disp(X2)
disp(T6*X2)
disp(T7*X2)
disp(X3)
disp(T6*X3)
disp(T7*X3)