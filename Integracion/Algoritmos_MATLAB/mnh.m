function [x1]=mnh(p,x0,tol,N)
[p0 p10]=mh(p,x0);
x1=x0-(p0/p10);
n=1;
while abs(x0-x1)>tol
    fprintf(' Iteración= %i x(%i)= %f Error= %f\n',n,n,x1,abs(x1-x0));
    n=n+1;
    x0=x1;
    [p0 p10]=mh(p,x0);
    x1=x0-(p0/p10);
end
fprintf('la Raiz del polinomio escrito es: ', x1)