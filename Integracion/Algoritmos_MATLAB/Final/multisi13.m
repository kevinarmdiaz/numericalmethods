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
s1=0;
s2=0;
for i=1:(n/2)-1
    s1=s1+si13(subs(f,x,a+(2*i-1)*h),c,d,m);
    s2=s2+si13(subs(f,x,a+2*i*h),c,d,m);
end
s1=s1+si13(subs(f,x,a+(2*(n/2)-1)*h),c,d,m);
s=h/3*(si13(subs(f,x,a),c,d,m)+si13(subs(f,x,b),c,d,m)+4*s1+2*s2)