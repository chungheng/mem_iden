%AVIVIQFM(V,I,T), at first, calculates the charge(Q) and flux(F) by
% integrating current(I) and voltage(V), respectively, then generates % 
% six animations, i.e. TvsV, TvsI, VvsI, IvsM, FvsQ, and QvsM.
%
% Author: Chung-Heng Yeh, <chyeh@ee.columbia.edu>
function aviVIQFM( V, I, T, filename )



N = 100;
Q = cumtrapz(T,I);
F = cumtrapz(T,V);
M = V./ I;


minT = min(T);
maxT = max(T);
minV = min(V);
maxV = max(V);
minI = min(I);
maxI = max(I);
minQ = min(Q);
maxQ = max(Q);
minF = min(F);
maxF = max(F);
minM = min(M);
maxM = max(M);


rect = [0,2000,1000,1000];
fig = figure('Position',rect);
set(fig,'DoubleBuffer','on');
set(gca,'nextplot','replace','Visible','off');


vidObj = VideoWriter(filename);
vidObj.FrameRate = 60;
vidObj.Quality = 100;
open(vidObj);

%{
subplot(4,3,1);grid on;

set(gca,'xlim',[minT  maxT],'ylim',[minV maxV],...
    'nextplot','replace','Visible','off');
subplot(4,3,2);grid on;

set(gca,'xlim',[minV  maxV],'ylim',[minI maxI],...
    'nextplot','replace','Visible','off');
subplot(4,3,3);grid on;

set(gca,'xlim',[minF  maxF],'ylim',[minQ maxQ],...
    'nextplot','replace','Visible','off');
subplot(4,3,4);grid on;

set(gca,'xlim',[minT  maxT],'ylim',[minT maxI],...
    'nextplot','replace','Visible','off');
subplot(4,3,5);grid on;

set(gca,'xlim',[minI  maxI],'ylim',[minI maxM],...
    'nextplot','replace','Visible','off');
subplot(4,3,6);grid on;

set(gca,'xlim',[minQ  maxQ],'ylim',[minM maxM],...
    'nextplot','replace','Visible','off');
%}
for idx=1:300:length(T)

    subplot(4,3,1);hold off;plot(T,V);hold on;plot(T(idx),V(idx),'r.','MarkerSize',16);
    grid on;xlabel('Time, sec');ylabel('Voltage, V');
    
    subplot(4,3,2);hold off;plot(V,I);hold on;plot(V(idx),I(idx),'r.','MarkerSize',16);
    grid on;xlabel('Voltage, V');ylabel('Current, A');
    
    subplot(4,3,3);hold off;plot(F,Q);hold on;plot(F(idx),Q(idx),'r.','MarkerSize',16);
    grid on;xlabel('Flux, W');ylabel('Charge, A*s');
    
    subplot(4,3,4);hold off;plot(T,I);hold on;plot(T(idx),I(idx),'r.','MarkerSize',16);
    grid on;xlabel('Time, sec');ylabel('Current, A');
    
    subplot(4,3,5);hold off;plot(I,M);hold on;plot(I(idx),M(idx),'r.','MarkerSize',16);
    grid on;xlabel('Current, A');ylabel('Memristance, ohm');
    
    subplot(4,3,6);hold off;plot(Q,M);hold on;plot(Q(idx),M(idx),'r.','MarkerSize',16);
    grid on;xlabel('Charge, A*s');ylabel('Memristance, ohm');
    
    subplot(4,3,[7 8 9 10 11 12]);hold off;plot3(T,F,Q);grid on;hold on;
    plot3(T(idx),F(idx),Q(idx),'r.','MarkerSize',16);
    xlabel('Time, sec');ylabel('Flux, W');zlabel('Charge');
   
    frame = getframe(gcf);
    writeVideo(vidObj,frame);
end
close(vidObj);

end
