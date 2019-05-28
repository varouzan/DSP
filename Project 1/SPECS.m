%% VAROUZAN KNOUNI DSP_1

close all; clear all
%% Setup
x=audioread('Wagner.wav');
sound(x,11025)
%% Part 1
[b,a]=ellip(4,0.1,70,1/320,'low');
g=upsample(x,320);
s=filter(b,a,g);
y=downsample(s,147);

soundsc(y,24000)

t1=srconvert1([1 zeros(1,3000)]);
verify(t1)

%% Part 2
h1 = firceqrip(30,1/4,[0.01 0.00031]); fvtool(h1);  
h3= firceqrip(30,1/7,[0.01 0.00031]); fvtool(h2); 
h4= firceqrip(30,1/3,[0.01 0.00031]); fvtool(h3);
a=1;

x1=upsample(x,4);
x2=filter(h1,a,x1);
x3=upsample(x2,4);
x4=filter(h1,a,x3);
x5=upsample(x4,4);
x6=filter(h1,a,x5);
x7=upsample(x6,5);
x8=filter(h3,a,x7);
x9=downsample(x8,7);
x10=filter(h3,a,x9);
x11=downsample(x10,7);
x12=filter(h4,a,x11);
x13=downsample(x12,3);

soundsc(x13,24000);


t2=finaltest([1 zeros(1,3000)]);
verify(t2)

%% Part 3
v1=polyup(h1,4,transpose(x));
v2=polyup(h1,4,v1);
v3=polyup(h1,4,v2);
v4=upsample(v3,5);
v5=polydown(h3,7,v4);
v6=polydown(h3,7,v5);
v7=polydown(h4,3,v6);

soundsc(v7,24000)

t3=finaltest1([1 zeros(1,3000)]);
verify(t3)
