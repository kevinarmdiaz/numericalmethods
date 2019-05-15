% Runge Kutta
clear all
clc
format long
syms x t y 
fx=input('Ingrese funcion:');
to=input('Ingrese limite inferior:');
tf=input('Ingrese limite superior:');
y=input('Ingrese Y(o):');
L=y;
h=input('Ingrese h:');
j=0;
l=1;
for i=to: h: tf
   Tk=to+j*h;
   u(l)=Tk;
   j=j+1;
   l=l+1;
end
u(l)=tf;
l=1;
cont=1;
p=y;
for i=to:h:tf
   t=u(l);
   x=u(l);
   f1=eval(fx);
   F1(l)=f1;
   t=u(l)+(h/2);
   y=p+(h/2)*f1;
   f2=eval(fx);
   F2(l)=f2;
   y=p+(h/2)*f2;
   f3=eval(fx);
   F3(l)=f3;
   t=u(l)+h;
   y=p+h*f3;
   f4=eval(fx);
   F4(l)=f4;
   Yk=p+(h/6)*(f1+2*f2+2*f3+f4);
   N(l)=Yk;
   p=Yk;
   l=l+1;
   cont=cont+1;
end
o(1)=L;
n(1)=0;
q(1)=0;
Q(1)=0;
H(1)=0;
l=1;
for i=2:cont
    o(i)=N(l);
    n(i)=F1(l);
    q(i)=F2(l);
    Q(i)=F3(l);
    H(i)=F4(l);
    l=l+1;
end
disp('El Orden en que salen las columnas es: k1 k2 k3 k4 W')
W=[h*n' h*q' h*Q' h*H' o']

