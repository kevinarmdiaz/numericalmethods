function [s]=tra(f,c,d,m)
F=inline(char(f));
k=(d-c)/m;
s=0;
for i=1:m-1
    s=s+F(c+i*k);
end
s=(k/2)*(F(c)+2*s+F(d));
end