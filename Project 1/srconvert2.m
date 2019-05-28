function x11 = srconvert2(x)
h1 = firceqrip(50,1/4,[0.01 0.00031]);
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

end

