function v7 = finaltest1(x)
h1 = firceqrip(30,1/4,[0.0001 0.000031]);  
h3= firceqrip(30,1/7,[0.0001 0.000031]); 
h4= firceqrip(30,1/3,[0.0001 0.000031]); 
a=1;

v1=polyup(h1,4,x);
v2=polyup(h1,4,v1);
v3=polyup(h1,4,v2);
v4=upsample(v3,5);
v5=polydown(h3,7,v4);
v6=polydown(h3,7,v5);
v7=polydown(h4,3,v6);
end

