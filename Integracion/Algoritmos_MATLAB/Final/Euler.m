% Método de Euler 
clear all 
clc
format long
syms x t y 
fprintf('\nMÉTODO DE EULER \n')
fx=input('Ingrese funcion:');
to=input('Ingrese limite inferior:');
tf=input('Ingrese limite superior:');
y=input('Ingrese Y(0):');
h=input('Ingrese incremento de paso:');
j=0;
l=1;
for i=to: h: tf
   Tk=to+j*h;
   u(l)=Tk;
   j=j+1;
   l=l+1;
end
l=1;
for i=to: h: tf
   t=u(l);
   x=u(l);
   d=eval(fx);
   Yk=y+h*d;
   b(l)=y;
   y=Yk;
   l=l+1;  
end
plot(u,b)
R=[u' b']