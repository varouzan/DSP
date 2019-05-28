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
w1=triang(8*256);
figure
spectrogram(s1,w1,8*255,8*256,1e4,'yaxis') 
title('narowband s1');

w2=triang(4*256);
figure
spectrogram(s5,w2,4*255,4*256,1e4,'yaxis')
title('narowband s5');
%woman in s1 talked slower than man in s2 and thus window could be bigger
%for s1 and thus better temporal resolution

%% Part 5
w3=triang(2*64);
figure
spectrogram(s1,w3,2*63,256,1e4,'yaxis') 
title('wideband s1');

w4=triang(256);
figure
spectrogram(s5,w4,255,256,1e4,'yaxis')
title('wideband s5');

%% Part 6
%soundsc(vowels,8*10^3)
w5=rectwin(256);
s=spectrogram(vowels,w5,128,1024,1e4,'yaxis');
out=zeros(1,8000);
s_temp=[s(1:end,1) s(end:1,1)'];
g=real(ifft(s_temp,1024));
out(1:256)=g(1:256);
for in=2:61
    s_temp=[s(1:end,in) s(end:1,in)'];
    g=real(ifft(s_temp,1024));
    out(129*(in-1):129*(in-1)+255)=g(1:256).'+out(129*(in-1):129*(in-1)+255);
end
out(129:end)=out(129:end)/2;

subplot(2,1,1);
plot(1:8000,out);
title('Recunstracted signal');
ylabel('Amplitude');
xlabel('time');

subplot(2,1,2);
plot(1:8000,vowels); 
title('Original signal');
ylabel('Amplitude');
xlabel('time');

soundsc(out,8000)
%% Part 7
x=s(1:end,1:2:end);

out=zeros(1,8000);
s_temp=[x(1:end,1) x(end:1,1)'];
g=real(ifft(s_temp,1024));
out(1:256)=g(1:256);
for in=2:31
    s_temp=[x(1:end,in) x(end:1,in)'];
    g=real(ifft(s_temp,1024));
    out(129*(in-1):129*(in-1)+255)=g(1:256).'+out(129*(in-1):129*(in-1)+255);
end
out(129:end)=out(129:end)/2;


subplot(2,1,1);
plot(1:8000,out);
title('compressed signal');
ylabel('amplitude');
xlabel('time');

subplot(2,1,2);
plot(1:8000,vowels);
title('original signal');
ylabel('amplitude');
xlabel('time');

soundsc(out,8000)