function y = srconvert1(x)
[b,a]=ellip(4,0.1,70,1/320,'low');
freqz(b,a)
g=upsample(x,320);
s=filter(b,a,g);
y=downsample(s,147);
soundsc(y,24000)
end

