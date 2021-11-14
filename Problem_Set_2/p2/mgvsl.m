function z = mgvsl(u,b,js)

n = length(u);
N = n-1;
h = 1/N;
up=zeros(n,1);

if ( n==3 )
    % solve exactly
    z = zeros(3,1);
    z(2) = -h^2/2*b(2);
else

    % js step of Jacobi
    
    for i=1:js
        for j=2:n-1
            up(j) = (u(j+1)+u(j-1))/2 - h^2/2*b(j);
        end
        up(1)=1;
        up(n)=3;
        u=up;
    end

    % compute residual
    r = zeros(n,1);
    r(2:n-1) = b(2:n-1) + (2*u(2:n-1)-u(1:n-2)-u(3:n)) / h^2;

    % restrict residual
    m = (n+1)/2;
    rhat = zeros(m,1);
    rhat(2:m-1) = (r(2:2:n-3) + 2*r(3:2:n-2) + r(4:2:n-1))/4;

    % recur
    uhat = mgv1n(zeros(size(rhat)),rhat);

    % interpolate
    ucor = zeros(n,1);
    ucor(3:2:n-2) = uhat(2:m-1);
    ucor(2:2:n-1) = .5*(uhat(1:m-1)+uhat(2:m));
    z = u + ucor;

    % js more step of Jacobi
    for i=1:js
        for j=2:n-1
            up(j) = (z(j+1)+z(j-1))/2 - h^2/2*b(j);
        end
        up(1)=z(1);
        up(n)=z(n);
        z=up;
    end
end

function z = mgv1n(u,b)
% 1d multigrid v-cycle for ch5ex9

n = length(u);
N = n-1;
h = 1/N;

if ( n==3 )
    % solve exactly
    z = zeros(3,1);
    z(2) = -h^2/2*b(2);
else

    % one step of GS
    for j=2:n-1
        u(j) = (u(j+1)+u(j-1))/2 - h^2/2*b(j);
    end

    % compute residual
    r = zeros(n,1);
    r(2:n-1) = b(2:n-1) + (2*u(2:n-1)-u(1:n-2)-u(3:n)) / h^2;

    % restrict residual
    m = (n+1)/2;
    rhat = zeros(m,1);
    rhat(2:m-1) = (r(2:2:n-3) + 2*r(3:2:n-2) + r(4:2:n-1))/4;

    % recur
    uhat = mgv1n(zeros(size(rhat)),rhat);

    % interpolate
    ucor = zeros(n,1);
    ucor(3:2:n-2) = uhat(2:m-1);
    ucor(2:2:n-1) = .5*(uhat(1:m-1)+uhat(2:m));
    z = u + ucor;

    % one more step of GS
    for j=2:n-1
        z(j) = (z(j+1)+z(j-1))/2 - h^2/2*b(j);
    end
end
