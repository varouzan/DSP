function y = polydown(h,M,x)
E=poly1(h,M);
y=zeros(1,ceil(size(x,2)/M)+1);
for i=1:M
    y1=zeros(1,size(x,2)+M); %clear stuff before delay
    y1(i:size(x,2)+i-1)=x(1:end); %delay
    y2=downsample(y1,M);
    y3=filter(E(i,1:end),1,y2); %apply filter
    y(1:size(y3,2))=y3(1:end)+y(1:size(y3,2)); %add up
end
end

