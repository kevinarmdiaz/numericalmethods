clear all
clc
syms x y
f=input('ingrese la función f(x,y): ');
I1=input('ingrese el intervalo [a,b] en corchetes: ');
I2=input('ingrese el intervalo [c,d] en corchetes: ');
n=input('ingrese n: ');
m=input('ingrese m: ');
a=I1(1,1);
b=I1(1,2);
c=I2(1,1);
d=I2(1,2);
f=inline(char(f));
h=(b-a)/n;
s=0;
for i=1:n-1;
    s=s+tra(subs(f,x,a+i*h),c,d,m);
end
s=(h/2)*(tra(subs(f,x,a),c,d,m)+2*s+tra(subs(f,x,b),c,d,m))