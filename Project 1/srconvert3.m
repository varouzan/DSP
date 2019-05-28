function v6= srconvert3(x)
h1 = firceqrip(50,1/4,[0.01 0.00031]); 
h2 = firceqrip(50,1/8,[0.01 0.00031]);
h3= firceqrip(50,1/10,[0.01 0.00031]); 
h4= firceqrip(50,1/7,[0.01 0.00031]); 
h5= firceqrip(50,1/3,[0.01 0.00031]); 
a=1;


v1=polyup(h1,4,x);
v2=polyup(h2,8,v1);
v3=polyup(h3,10,v2);
v4=downsample(v3,7);
v5=polydown(h4,7,v4);
v6=polydown(h5,3,v5);


end

