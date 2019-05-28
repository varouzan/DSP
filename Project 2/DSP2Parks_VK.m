%% Varouzan Knouni DSP Project 2
clear all ; close all;
%% Parks Mc-Cellan
load ProjiB
rp = 2;           % Passband ripple
rs = 100;          % Stopband ripple  
fpb=2500;
fsb=4000;
f = [fpb fsb];    % Cutoff frequencies
a = [1 0];        % Desired amplitudes

dev = [(10^(rp/20)-1)/(10^(rp/20)+1)  10^(-rs/20)]; 
[n,fo,ao,w] = firpmord(f,a,dev,fs);
b = firpm(n,fo,ao,w);

Hd_filt = dfilt.df1(b);

Hd_gain = dfilt.scalar(85);
parksfilt = cascade(Hd_gain,Hd_filt);
hfvt = fvtool(parksfilt);

h=freqz(parksfilt);
figure('NumberTitle', 'off', 'Name', 'Parks Mc-Cellan filter');
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

[gd,w] = grpdelay(parksfilt);
subplot(3,2,3)
plot(w/pi,gd)
title('Group delay')
ylabel('Samples')
xlabel('normalized by pi');

subplot(3,2,5)
zplane(b,a)

imp=[1 zeros(1,99)];
impresp=filter(parksfilt,imp);
subplot(3,2,6)
stem(1:100, impresp)
title('Impulse Response')

out1=filter(parksfilt,noisy);
soundsc(out1,fs);
numofmult=size(b,2);
% order is n and nummber of multiplications is numofmult