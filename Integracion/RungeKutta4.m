clear all
clc
close all
% % •Método de rk4 
disp('*************************************************************************************');
disp('*******************************Método de Runge Kutta orden 4.*******************************');
disp('*************************************************************************************');
syms  x y;
funcion=input('Ingrese la función F(x,y)       :  ');
funcionReal=input('Ingrese la solución real F(x,y)       :  ');
a=input('Ingrese el punto a, límite inferior :  ');
b=input('Ingrese el punto b, límite superior :  ');
h=input('Ingrese tamaño de paso (h)          :  ');
Condicion_Inicial=input('Ingrese Y0               :  ');
YpHeun=[];YReal=[];
f=inline(char(funcion),'x','y');
fReal=inline(char(funcionReal),'x');
%% Calculamos los subintervalos.
N=(b-a)/(h);
xi(1)=a;
YRk4(1)=Condicion_Inicial;
YReal(1)=fReal(xi);
Error=abs(YRk4(1)-YReal(1));
for i=1:N
    xi(i+1)=a+i*h;
    %% Calculamos solución real.
    YReal(i+1)=fReal(xi(i+1));
end
for i=1:N
     fprintf('iteracion n=%i     x%i=%f  Aproximación=%f     Real=%.6f   Error=%f \n',i-1,i-1,xi(i),YRk4(i),YReal(i),Error);
    %% Calculamos K's
    k1=h*f(xi(i),YRk4(i));
    k2=h*f(xi(i)+h/2,YRk4(i)+k1/2);
    k3=h*f(xi(i)+h/2,YRk4(i)+k2/2);
    k4=h*f(xi(i+1),YRk4(i)+k3);
    YRk4(i+1)=YRk4(i)+(1/6)*(k1+2*k2+2*k3+k4);
    %% Calculamos el error.
    Error=abs(YRk4(i)-YReal(i));
end
%% Graficamos
plot(xi,YReal,xi,YRk4);
title('Método de Runge Kutta Orden 4');
grid on;
legend('Curva real','Curva Aproximada');