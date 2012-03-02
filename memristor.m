% MEMRISTOR(I, t, r, b, x0) takes injected current I as the input and 
% generates the ouput voltage U with respect to the initial state X0, 
% and the parameters, R and B. The ideal memristor can be characterize 
% as the follows[1],
%     u(t)  = M(x)*i(t)
%     M(x)  = [x+(1-x)r]*i(t)
%     dx/dt = i(t) / b 
% 
% [1] L. O. Chua, "Memristor?The Missing Circuit Element", IEEE 
%     Transactions on Circuit Theory, vol 18, 507?519, Sep. 1971.
%
% Author: Chung-Heng Yeh, <chyeh@ee.columbia.edu>


function [I, x] = memristor( V, t, r, b, x0)

% beta reciprocal
br = 1 / b;
% Initialize the time-related parameters
dt = diff(t(1:2));
N  = length(t);

% Initialize internal state, current and mem-conductance arrays
x = zeros(1,N);
I = zeros(1,N);
M = zeros(1,N);
x(1) = x0;



f = @(i) (i * br);

for i = [1:N-1]
    M(i) = x(i) + (1-x(i))*r;
    I(i) = V(i) / M(i);
    I2   = 0.5*( I(i) + V(i+1) / M(i));
    % Use the second-order Runge-Kutta method to simulate x
    dx = dt * f(I2);
    x(i+1) = x(i) + dx;
    if x(i+1)>1,
        x(i+1) = 1;
    elseif x(i+1)<0,
        x(i+1) = 0;
    end
end

