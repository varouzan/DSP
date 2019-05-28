function y =polyup(h,L,x)
E=poly1(h,L);
y1=zeros(1,size(x,2));
y=zeros(1,size(x,2)*L+L);
for i=1:L
    y1(1:size(x,2))=filter(E(i,1:end),1,x); %apply filter
    y2=upsample(y1,L);  
    y(i:size(y2,2)+i-1)=y(i:size(y2,2)+i-1)+y2(1:size(y2,2)); %delay and add up
end
end

