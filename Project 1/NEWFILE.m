%% VAROUZAN KNOUNI DSP_1

close all; clear all
%% Setup
x=audioread('Wagner.wav');
sound(x,11025)
%% Part 1
[b,a]=ellip(4,0.1,70,1/320,'low'); %create IIF filter
g=upsample(x,320);
s=filter(b,a,g);
y=downsample(s,147);

soundsc(y,24000)

t1=srconvert1([1 zeros(1,3000)]);
verify(t1)

%% Part 2
%create FIR filters
h1 = firceqrip(50,1/4,[0.01 0.00031]); %fvtool(h1);
h2 = firceqrip(50,1/8,[0.01 0.00031]); 
h3= firceqrip(50,1/10,[0.01 0.00031]);  
h4= firceqrip(50,1/7,[0.01 0.00031]); 
h5= firceqrip(50,1/3,[0.01 0.00031]); 
a=1;

x1=upsample(x,4);
x2=filter(h1,a,x1);
x3=upsample(x2,8);
x4=filter(h2,a,x3);
x5=upsample(x4,10);
x6=filter(h3,a,x5);
x7=downsample(x6,7);
x8=filter(h4,a,x7);
x9=downsample(x8,7);
x10=filter(h5,a,x9);
x11=downsample(x10,3);

soundsc(x11,24000);


t2=srconvert2([1 zeros(1,3000)]);
verify(t2)

%% Part 3
%use the same filters as Part 2
v1=polyup(h1,4,transpose(x));
v2=polyup(h2,8,v1);
v3=polyup(h3,10,v2);
v4=downsample(v3,7);
v5=polydown(h4,7,v4);
v6=polydown(h5,3,v5);

soundsc(v6,24000)

t3=srconvert3([1 zeros(1,3000)]);
verify(t3)
