%% Varouzan Knouni DSP Project 2
clear all ; close all;
%% Kaiser-Soze
load ProjIB
%soundsc(noisy,fs);
rp = 3;           % Passband ripple
rs = 100;          % Stopband ripple  
fpb=2500;
fsb=4000;
fcuts = [fpb fsb];
mags = [1 0];
devs = [(10^(rp/20)-1)/(10^(rp/20)+1)  10^(-rs/20)]; 

[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fs);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

Hd_filt = dfilt.df1(hh);

Hd_gain = dfilt.scalar(100);
kaiserfilt = cascade(Hd_gain,Hd_filt);
hfvt = fvtool(kaiserfilt);

h=freqz(kaiserfilt);
figure('NumberTitle', 'off', 'Name', 'Kaiser filter');
subplot(3,2,1)
plot(linspace(0,1,length(h)),mag2db(abs(h)))
title('Frequency Respone')
ylabel('db Scale')
xlabel('normalized by pi');

subplot(3,2,2)
x=1:ceil(fpb/(fs/2)*length(h));
plot(x,abs(h(x)));
title('Zoomed in Frequency Respone')
ylabel('linear scale')
xlabel('normalized by pi');

[gd,w] = grpdelay(kaiserfilt);
subplot(3,2,3)
plot(w/pi,gd)
title('Group delay')
ylabel('Samples')
xlabel('normalized by pi');

subplot(3,2,5)
zplane(hh)

imp=[1 zeros(1,99)];
impresp=filter(kaiserfilt,imp);
subplot(3,2,6)
stem(1:100, impresp)
title('Impulse Response')

out1=filter(kaiserfilt,noisy);
soundsc(out1,fs);
numofmult=(size(hh,2));
% order is n and nummber of multiplications is numofmult