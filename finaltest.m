function x13 = finaltest(x)
h1 = firceqrip(30,1/4,[0.0001 0.31]);   
h3= firceqrip(30,1/7,[0.0001 0.00031]); 
h4= firceqrip(30,1/3,[0.0001 0.31]); 
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
end

