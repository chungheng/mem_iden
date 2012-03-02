%PLOTVIQFM(V,I,T), at first, calculates the charge(Q) and flux(F) by
% integrating current(I) and voltage(V), respectively, then generates six 
% digrams, i.e. TvsV, TvsI, VvsI, IvsM, FvsQ, and QvsM.
%
% Author: Chung-Heng Yeh, <chyeh@ee.columbia.edu>
function plotVIQFM( V, I, T )

N = 100;
Q = cumtrapz(T,I);
F = cumtrapz(T,V);
M = V./ I;

ColorSet = varycolor(N);


figure();
intvl = floor( length(T) / N ); 




for i = 1:6
    subplot(4,3,i);
    set(gca, 'ColorOrder', ColorSet);
end

for i=0:N-1
    first = 1+i*intvl;
    last  = first+intvl;
    if last > length(T),
        last = length(T);
    end
    idx = first:last; 
    
    subplot(4,3,1);grid on;hold all;plot(T(idx),V(idx));
    xlabel('Time, sec');ylabel('Voltage, V');
    subplot(4,3,2);grid on;hold all;plot(V(idx),I(idx));
    xlabel('Voltage, V');ylabel('Current, A');
    subplot(4,3,3);grid on;hold all;plot(F(idx),Q(idx));
    xlabel('Flux, W');ylabel('Charge, A*s');
    subplot(4,3,4);grid on;hold all;plot(T(idx),I(idx));
    xlabel('Time, sec');ylabel('Current, A');
    subplot(4,3,5);grid on;hold all;plot(I(idx),M(idx));
    xlabel('Current, A');ylabel('Memristance, ohm');
    subplot(4,3,6);grid on;hold all;plot(Q(idx),M(idx));
    xlabel('Charge, A*s');ylabel('Memristance, ohm');
end

colormapTick = cell(1,10);
for i = 1:10
    colormapTick{i} = num2str( T(end) / 10 * i );
end

subplot(4,3,[7 8 9 10 11 12]);plot3(T,F,Q);grid on;
xlabel('Time, sec');ylabel('Flux, W');zlabel('Charge');
set(gcf, 'ColorMap', ColorSet);
colorbar('YTickLabel',colormapTick);









