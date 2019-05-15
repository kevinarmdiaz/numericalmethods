clc 
clear
syms x
f=input('digite la funcion f=');
I=input('digite el intervalo I=');
n=input('digite el # de subintervalos n=');
while mod(n,2)==1
    n=input('digite un nuevo valor de n par');
end
f=sym(f);
F=inline(char(f));
a=I(1,1);
b=I(1,2);
h=(b-a)/n;
s1=0;s2=0;k=n/2;
for i=1:k-1
    s1=s1+F(a+(2*i-1)*h);
    s2=s2+F(a+(2*i)*h);
end
s1=s1+F(a+(2*k-1)*h);
s=(h/3)*(F(a)+4*s1+2*s2+F(b))
