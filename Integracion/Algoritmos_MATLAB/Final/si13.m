function [s]=si13(f,c,d,m)
F=inline(char(f));
k=(d-c)/m;
s1=0;
s2=0;
for i=1:((m/2)-1)
    s1=s1+F(c+(2*i-1)*k);
    s2=s2+F(c+(2*i)*k);
end
s1=s1+F(c+(2*(m/2)-1)*k);
s=(k/3)*(F(c)+4*s1+2*s2+F(d));
end