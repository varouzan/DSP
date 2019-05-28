%% Varouzan Knouni DSP Project 2
clear all ; close all;
%% Chebyshev Type 2
load ProjiB
fpb=2500;
fsb=4000;
[n,Wn]=cheb2ord(fpb/(fs/2),fsb/(fs/2),3,95);
[z,p,k]=cheby2(n,95,(fsb/(fs/2)));

[s,g] = zp2sos(z,p,k);         
Hd_filt = dfilt.df1tsos(s,g);


Hd_gain = dfilt.scalar(100);
butfilter = cascade(Hd_gain,Hd_filt);
hfvt = fvtool(butfilter);

h=freqz(butfilter);
figure('NumberTitle', 'off', 'Name', 'Chebyshev Type 2 filter');
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

[gd,w] = grpdelay(butfilter);
subplot(3,2,3)
plot(w/pi,gd)
title('Group delay')
ylabel('Samples')
xlabel('normalized by pi');

subplot(3,2,5)
object=coeffs(butfilter);
[newb,newa]=sos2tf(object.Stage2.SOSMatrix);
zplane(newb,newa);

imp=[1 zeros(1,99)];
impresp=filter(butfilter,imp);
subplot(3,2,6)
stem(1:100, impresp)
title('Impulse Response')

out1=filter(butfilter,noisy);
soundsc(out1,fs);
numofmult=(size(newa,2)-1+size(newb,2));
% order is n and nummber of multiplications is numofmult