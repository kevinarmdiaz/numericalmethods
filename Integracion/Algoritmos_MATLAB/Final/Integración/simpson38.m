clc
clear
syms x
f=input ('digite la funcion f=');
n=input('numero de sub-intervalos n=');
while mod(n,3)==1 | mod(n,3)==2
    fprintf('n tiene que ser multiplo de 3' );
    n=input('digite un nuevo valor para n');
end
i=input ('digite el intervalo a integrar i=');
a=i(1,1);
b=i(1,2);
h=(b-a)/n;
x=a;s=0; s=s+eval(f);
k=n/3;
x=a+h; s=s+3*eval(f);
x=a+2*h; s=s+3*eval(f);
for j=1:k-1
    x=a+(3*j+1)*h;     s=s+3*eval(f);
    x=a+(3*j+2)*h;     s=s+3*eval(f);
    x=a+3*j*h;         s=s+2*eval(f);
end
x=b; s=s+eval(f);
s=((3*h)/8)*s;
fprintf('el valor aproximado de la integral es = %f',s);