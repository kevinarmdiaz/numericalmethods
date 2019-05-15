function [p0 p10]=mh(p,x0)
n=length(p);
p0=p(1);
p10=p(1);
for j=2:n-1
    p0=p0*x0+p(j);
    p10=p10*x0+p0;
end
p0=p0*x0+p(n);

    
    