%ADDPULSE(I,t,w,h) injects a pulse to IN at each of TP with amplitude H and
% width W.
%
% Author: Chung-Heng Yeh, <chyeh@ee.columbia.edu>

function in = addpulse(in, t, tp, w, h)


dt = diff(t(1:2));

tpIdx = ceil( (tp - t(1)) / dt );
wIdx  = ceil( w / dt );
wSyn  = wIdx * dt;

for i = 1:length(tpIdx)
    period = 2*wSyn(i) ;
    dur = (0:wIdx(i)) * dt;
    intvl = tpIdx(i):tpIdx(i)+wIdx(i);
    pulse = h(i)*sin(2*pi*dur/period);
    in( intvl ) = in( intvl ) + pulse;
    
end