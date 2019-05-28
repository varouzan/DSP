%% Varouzan Knouni DSP Project 2
clear all ; close all;
%% ellipt
load ProjiB
fpb=2500;
fsb=4000;
[n,Wn]=ellipord(fpb/(fs/2),fsb/(fs/2),3,95);
[b,a]=ellip(n,3,95,(fpb/(fs/2)));

Hd_filt = dfilt.df1(b,a);
Hd_gain = dfilt.scalar(100);
ellipfilt = cascade(Hd_gain,Hd_filt);
hfvt = fvtool(ellipfilt);

h=freqz(ellipfilt);
figure('NumberTitle', 'off', 'Name', 'Elliptic  filter');
subplot(3,2,1)
plot(linspace(0,1,length(h)),mag2db(abs(h)))
title('Frequency Respone')
ylabel('db Scale')
xlabel('normalized by pi');

subplot(3,2,2)
x=1:ceil(fpb/(fs/2)*length(h));
plot(x,abs(h(x)));
title('Frequency Respone')
ylabel('linear scale')
xlabel('normalized by pi');

[gd,w] = grpdelay(ellipfilt);
subplot(3,2,3)
plot(w/pi,gd)
title('Group delay')
ylabel('Samples')
xlabel('normalized by pi');

subplot(3,2,5)
zplane(b,a)

imp=[1 zeros(1,99)];
impresp=filter(ellipfilt,imp);
subplot(3,2,6)
stem(1:100, impresp)
title('Impulse Response')

out1=filter(ellipfilt,noisy);
soundsc(out1,fs);
numofmult=(size(a,2)-1+size(b,2));
% order is n and nummber of multiplications is numofmult