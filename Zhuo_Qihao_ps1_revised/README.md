# AME60614 Problem 1

$p1\_1.m,p1\_2.m,p1\_3.m,p1\_4.m$ are four Matlab scripts to solve matrix equations for coefficients and truncation errors in Problem 1. 
The matrix equations come from Taylor series. In $p1\_4.m$ the matrices are modified because of the first derivative terms. 
Scripts and output are included in $p1$ folder. 

$p2\_2\_{rev}.m$ is used to calculate numerical derivatives with Richardson Extrapolation. All results are within one run of that code. 

$p3\_1\_{rev}.m$ is a Matlab script used to realize the algorithm of solving the Volterra integral equation with trapezoid method. 
$\bm{M}$ and $\bm{g}$ are set up through loops and the values come from the trapezoid method. In the end, the script 
solve the matrix equation to get a set of discrete values of $\bm{f}$. And then errors of different 
$N$ are also calculated. 

$p4\_1.f90$ is a Fortran code for Simpson rule. For different functions, the expressions should be modified separately. 
$p4\_2.mlx$ is a Matlab script of Gauss-Hermite Quadrature, in which there is a function module to solve weights and abscissas. 
In the main part, number of quadrature points and function expressions could be user-defined. 

Latex files are include in the $tex$ folder. 
