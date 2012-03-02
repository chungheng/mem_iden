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

function [I new_para] = memristor_step( V1, V2, para )


% Initialize internal state, current and mem-conductance arrays
x  = para(1);
r  = para(2);
b  = para(3);
dt = para(4);


f = @(i) (i / b);


M  = x + (1-x)*r;
I  = V1 / M;
I2 = 0.5*( I + V2/M ) ;
% Use the second-order Runge-Kutta method to simulate x
dx = dt * f(I2);
x  = x + dx;
if x>1,
    x = 1;
elseif x<0,
    x = 0;
end

new_para = [x r b dt];

end