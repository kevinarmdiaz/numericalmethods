clc 
clear
syms x
f=input('digite la funcion f=');
I=input('digite el intervalo I=');
n=input('digite el # de subintervalos n=');
f=sym(f)
F=inline(char(f))
a=I(1,1);
b=I(1,2);
h=(b-a)/n;
s=0;
for i=1:n-1
    s=s+F(a+i*h);
end
s=(h/2)*(F(a)+2*s+F(b))

