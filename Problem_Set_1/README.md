# AME60614 Problem 1

$p1\_1.m,p1\_2.m,p1\_3.m,p1\_4.m$ are four Matlab scripts to solve matrix equations for coefficients and truncation errors in Problem 1. 

The matrix equations come from Taylor series. In $p1\_4.m$ the matrices are modified because of the first derivative terms. 

Scripts and output are included in $p1$ folder. 



$p2\_0\_1h.mlx,p2\_0\_2h.mlx,p2\_0\_4h.mlx,p2\_0\_8h.mlx$ are modified from scripts used in Problem 1 and used to 

solve expressions of fourth central differential expressions with different stencils. $p2\_1.mlx$ is to solve different 

matrix equations to get expressions of Richardson Extrapolation with different accuracy. $p2\_2.f90$ is a Fortran code 

used to calculate numerical derivatives with expressions from $p2\_1.mlx$. In the Fortran code, there are two user-defined functions 

to solve function value and central differential values. 



$p3\_1.mlx$ is a Matlab script used to realize the algorithm of solving the Volterra integral equation with trapezoid method. 

$I+M$ and $g$ are set up through loops and the values come from the trapezoid method. In the end, the script 

solve the matrix equation to get a set of discrete values of $f$. 



$p4\_0.f90$ is a simple code to test value of $x^4 \left[\frac{1}{\sqrt{2\pi}}e^{-\frac{x^2}{2}}\right]$ to determine integral intervals. 

$p4\_1.f90$ is a Fortran code for Simpson rule. For different functions, the expressions could be modified directly. 

$p4\_2.mlx$ is a Matlab script of Gauss-Hermite Quadrature, in which there is a function module to solve weights and abscissas. 

In the main part, number of quadrature points and function expressions could be user-defined. 



Latex files are include in the $tex$ folder. 
