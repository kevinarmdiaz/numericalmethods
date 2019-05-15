clear all
clc
% % •Método de euler 
disp('*************************************************************************************');
disp('*******************************Método de runge kutta orden4.*******************************');
disp('*************************************************************************************');
funcion=input('Ingrese la función F(x,y)       :  ');
funcionReal=input('Ingrese la solución real F(x,y)       :  ');
a=input('Ingrese el punto a, límite inferior :  ');
b=input('Ingrese el punto b, límite superior :  ');
h=input('Ingrese tamaño de paso (h)          :  ');
Condicion_Inicial=input('Ingrese Y0               :  ');
Y=[];YReal=[];
f=inline(funcion,'x','y');
fReal=inline(funcionReal,'x');
%% Calculamos los subintervalos.
N=(b-a)/(h)+1;
xi(1)=a;
Y(1)=Condicion_Inicial;
YReal(1)=fReal(xi);
Error=abs(Y(1)-YReal(1));
for i=1:N+1
    xi(i+1)=a+i*h;
    %% Calculamos solución real.
    YReal(i+1)=fReal(xi(i+1));
end
for i=1:N+1
fprintf('iteracion n=%i     x%i=%f  Aproximación=%f     Real=%.6f   Error=%f \n',i-1,i-1,xi(i),Y(i),YReal(i),Error);
%% Solución aproximada.
k1=f(xi(i),Y(i));
k2=f(xi(i)+h/2 ,Y(i)+(h/2)*k1);
k3=f(xi(i)+h/2 ,Y(i)+(h/2)*k2);
k4=f(xi(i)+h ,Y(i)+ h*k3);
Y(i+1)=Y(i)+(h/6)*(k1+2*k2+2*k3+k4)
%% Calculamos el error.
Error=abs(Y(i+1)-YReal(i+1));
end
%% Graficamos
plot(xi,Y);
title('Método de rk4');
grid on;
legend('Curva real','Curva Aproximada');