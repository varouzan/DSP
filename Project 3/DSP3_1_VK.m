%% Varouzan Knouni 
close all; clear all; load s1; load s5; load vowels; 
%% Part 1
L=200*10^(-6);
fs=5*10^6;
miu=4*10^(9);
n=fs*L;
t=linspace(0,L,n);
x=cos(2*pi*miu*t.^2);
w=triang(256);
figure
spectrogram(x,w,255,256,1e4,'yaxis')

%% Part 2
f1=miu*t;
x1=cos(2*pi*f1.*t);
figure
spectrogram(x1,w,255,256,1e4,'yaxis')

f2=1/(2*pi)*diff(2*pi*f1.*t)*fs/2;
x2=cos(2*pi*f2.*t(1,1:end-1));
figure
spectrogram(x2,w,255,256,1e4,'yaxis')

%% Part 3
miu=1*10^10;
L=200*10^(-6);
fs=5*10^6;
n=fs*L;
t=linspace(0,L,n);
x=cos(2*pi*miu*t.^2);
w=triang(256);
figure
spectrogram(x,w,255,256,1e4,'yaxis')
% "max" frequencty of sampled signal is fs. Thus for f>fs we get aliasing 

%% Part 4
%soundsc(s1,8*10^3)
%soundsc(s5,8*10^3)
w=triang(1/4*256);
figure
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                