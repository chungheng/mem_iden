% Subject: Memristor Test
% Author : Chung-Heng Yeh <chyeh@ee.columbia.edu>
% Detail : testing memristor module

%% Sine Wave
% amplitude: 0.8
% duration : 8 period


w   = 4;
T   = 1/w;
dt  = 1e-5;
N   = 8;
dur = N*T;
a   = 0.8;


r  = 160;
b  = 0.01;
x0 = 0.1;

t1 = 0:dt:dur/2-dt;
t2 = dur/2:dt:dur-dt;
t  = [t1 t2];
V  = sin(2*w*pi*t-pi/2)*a;


[I] = memristor( V, t, r, b, x0);
%plotVIQFM(V,I,t);
%myPrintFig(gcf,'../pic/', 'sin_viqfm', 'notexp' );
aviVIQFM(V,I,t,'../video/test.avi');


%% Sine Wave Offset
w   = 4;
T   = 1/w;
dt  = 1e-3;
N   = 16;
dur = N*T;
a   = 0.05;


r  = 160;
b  = 0.01;
x0 = 0.1;

t1 = 0:dt:dur/2-dt;
t2 = dur/2:dt:dur+T;
t  = [t1 t2];
V  = [sin(2*w*pi*t1-pi/2)*a+a -sin(2*w*pi*t2-pi/2)*a-a];


[I, x] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'sin_off_viqfm', 'isexp' );



%% Sine Wave Offset
w   = 4;
T   = 1/w;
dt  = 1e-5;
N   = 8;
dur = N*T;
a   = 0.6;


r  = 160;
b  = 0.01;
x0 = 0.1;

t1 = 0:dt:dur/2-dt;
t2 = dur/2:dt:dur+T;
t  = [t1 t2];
V  = [sin(2*w*pi*t1-pi/2)*a+a -sin(2*w*pi*t2-pi/2)*a-a];


[I, x] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'sin_off_viqfm', 'notexp' );



%% Positive Impulse Train
dt  = 1e-5;
dur = 1;
w   = ones(1,9)*0.005;
h   = ones(1,9)*1;
tp  = 0.1:0.1:0.9;
t   = 0:dt:dur-dt;

r  = 160;
b  = 0.01;
x0 = 0.1;

V  = zeros(size(t));
V  = addpulse(V,t,tp,w,h);

[I] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'pos_impulse_viqfm', 'notexp' );


%% Negative Impulse Train
dt  = 1e-5;
dur = 1;
w   = ones(1,9)*0.005;
h   = ones(1,9)*-1;
tp  = 0.1:0.1:0.9;
t   = 0:dt:dur-dt;

r  = 160;
b  = 0.01;
x0 = 0.1;

V  = zeros(size(t));
V  = addpulse(V,t,tp,w,h);

[I] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'neg_impulse_viqfm', 'notexp' );

%% Negative Impulse Train Approaching Boundary
dt  = 1e-5;
dur = 3;
np  = 29;
w   = ones(1,np)*0.005;
h   = ones(1,np)*-2;
tp  = (1:np)*0.1;
t   = 0:dt:dur-dt;

r  = 160;
b  = 0.01;
x0 = 0.1;

V  = zeros(size(t));
V  = addpulse(V,t,tp,w,h);

[I] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'intense_neg_impulse_viqfm', 'notexp' );
aviVIQFM(V,I,t,'../video/intense_neg_impulse_viqfm.avi');


%% Sine Wave with offset plus Negative Impulse Train Approaching Boundary

np  = 14;
wid = ones(1,np)*0.005;
hei   = ones(1,np)*-2;
tp  = (1:np)*0.2;

w   = 4;
T   = 1/w;
dt  = 1e-5;
N   = 8;
dur = N*T;
a   = 0.6;


r  = 160;
b  = 0.01;
x0 = 0.1;

t1 = 0:dt:dur/2-dt;
t2 = dur/2:dt:dur+T*4;
t  = [t1 t2];
V  = [sin(2*w*pi*t1-pi/2)*a+a -sin(2*w*pi*t2-pi/2)*a-a];
V  = addpulse(V,t,tp,wid,hei);

[I] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'offsine_neg_impulse_viqfm', 'notexp' );
aviVIQFM(V,I,t,'../video/offsine_neg_impulse_viqfm.avi');


%% Sine Wave + Negative Impulse Train
% amplitude: 0.8
% duration : 8 period
np  = 24;
wid = ones(1,np)*0.005;
hei   = ones(1,np)*-2;
tp  = (1:np)*0.25;

w   = 4;
T   = 1/w;
dt  = 1e-5;
N   = 25;
dur = N*T;
a   = 0.8;


r  = 160;
b  = 0.01;
x0 = 0.1;

t1 = 0:dt:dur/2-dt;
t2 = dur/2:dt:dur-dt;
t  = [t1 t2];
V  = sin(2*w*pi*t-pi/2)*a;
V  = addpulse(V,t,tp,wid,hei);

[I] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'sin_negative_pulse_viqfm', 'notexp' );
aviVIQFM(V,I,t,'../video/test.avi');
%% Negative Constant
r  = 160;
b  = 0.01;
x0 = 0.1;

dt = 1e-5;
a  = -0.5;
t  = 0:dt:1;
V  = t*a;

[I] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'negative_constant_viqfm', 'isexp' );


%% Sine Wave: Explore boundaries
w   = 4;
T   = 1/w;
dt  = 1e-5;
N   = 8;
dur = N*T;
a   = 0.6;


r  = 160;
b  = 0.01;
x0 = 0.1;

t1 = 0:dt:dur/2-dt;
t2 = dur/2:dt:dur+T-dt;
t3 = dur+T:dt:dur+7*T-dt;
t4 = dur+7*T:dt:dur+12*T-dt;
t  = [t1 t2 t3 t4];
V  = [sin(2*w*pi*t1+pi*3/8)*a-a sin(2*w*pi*t2-pi/2)*a+a ...
      sin(2*w*pi*t3+pi*3/8)*a-a sin(2*w*pi*t4-pi/2)*a+a  ];


[I, x] = memristor( V, t, r, b, x0);
plotVIQFM(V,I,t);
myPrintFig(gcf,'../pic/', 'sin_off_viqfm_boundary', 'notexp' );

aviVIQFM(V,I,t,'../video/sin_off_viqfm2.avi');