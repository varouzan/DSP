%% VAROUZAN KNOUNI DSP_1

close all; clear all
%% Setup
x=audioread('Wagner.wav');
sound(x,11025)
%% Part 1
[b,a]=ellip(4,0.1,70,1/320,'low');
freqz(b,a)
g=upsample(x,320);
s=filter(b,a,g);
y=downsample(s,147);
soundsc(y,24000)

%% Part 2
h1 = firceqrip(30,1/32,[0.001 0.000031]); fvtool(h1);
h2= firceqrip(30,1/10,[0.001 0.000031]); fvtool(h2)
h3= firceqrip(30,1/21,[0.001 0.000031]); 
a=1;

x1=upsample(x,32);
x2=filter(h1,a,x1);
x3=upsample(x2,10);
x4=filter(h2,a,x3);
x5=downsample(x4,7);
x6=filter(h3,a,x5);
x7=downsample(x6,21);

soundsc(x7,24000);

t3=srconvert([1 zeros(1,3000)]);
verify(t3)
%% Part 3
%y1=zeros(32,73245);
%%y=zeros(1,2343840+32);
%{
for i=1:32
    y1(i,1:size(x))=filter(E1(i,1:end),a,x);
    y2=upsample(y1(i,1:size(x)),32);
    y(i:size(y2)+i)=y(i:size(y2)+i)+y2(1:size(y2));
end


y1=zeros(1,73245);
y=zeros(1,2343840+32);
y1(1:size(x))=filter(E1(1,1:end),a,transpose(x));
y2=upsample(y1,32);
y(1:size(y2,2))=y(1:size(y2,2))+y2(1:size(y2,2));
   
E1(1,1:end)

%}
v1=polyup(h1,32,transpose(x));
v2=polyup(h2,10,v1);
v3=downsample(v2,7);
v4=polydown(h3,21,v3);
soundsc(v4,24000)


