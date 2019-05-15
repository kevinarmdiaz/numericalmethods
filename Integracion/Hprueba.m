clear all
clc
close all
% % �M�todo de euler 
disp('*************************************************************************************');
disp('*******************************M�todo de Heun.*******************************');
disp('*************************************************************************************');
syms  x y;
funcion=input('Ingrese la funci�n F(x,y)       :  ');
funcionReal=input('Ingrese la soluci�n real F(x,y)       :  ');
a=input('Ingrese el punto a, l�mite inferior :  ');
b=input('Ingrese el punto b, l�mite superior :  ');
h=input('Ingrese tama�o de paso (h)          :  ');
Condicion_Inicial=input('Ingrese Y0               :  ');
YpHeun=[];YReal=[];
f=inline(char(funcion));
fReal=inline(char(funcionReal));
%% Calculamos los subintervalos.
N=(b-a)/(h);
xi(1)=a;
YHc(1)=Condicion_Inicial;
YReal(1)=fReal(xi);
Error=abs(YHc(1)-YReal(1));
for i=1:N
    xi(i+1)=a+i*h;
    %% Calculamos soluci�n real.
    YReal(i+1)=fReal(xi(i+1));
end
for i=1:N
fprintf('iteracion n=%i     x%i=%f  Aproximaci�n=%f     Real=%.6f   Error=%f \n',i-1,i-1,xi(i),YHc(i),YReal(i),Error);
%% Soluci�n aproximada (Predicci�n de euler)
k1=f(xi(i),YHc(i));
YPrediccion=YHc(i)+h*k1; 
k2=f(xi(i+1),YPrediccion);
YHc(i+1)=YHc(i)+h/2*(k1+k2);
end
%% Graficamos
plot(xi,YReal,xi,YHc);
title('M�todo de Heun');
grid on;
legend('Curva real','Curva Aproximada');