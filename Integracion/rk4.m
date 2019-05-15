clear all
clc
% % �M�todo de euler 
disp('*************************************************************************************');
disp('*******************************M�todo de runge kutta orden4.*******************************');
disp('*************************************************************************************');
funcion=input('Ingrese la funci�n F(x,y)       :  ');
funcionReal=input('Ingrese la soluci�n real F(x,y)       :  ');
a=input('Ingrese el punto a, l�mite inferior :  ');
b=input('Ingrese el punto b, l�mite superior :  ');
h=input('Ingrese tama�o de paso (h)          :  ');
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
    %% Calculamos soluci�n real.
    YReal(i+1)=fReal(xi(i+1));
end
for i=1:N+1
fprintf('iteracion n=%i     x%i=%f  Aproximaci�n=%f     Real=%.6f   Error=%f \n',i-1,i-1,xi(i),Y(i),YReal(i),Error);
%% Soluci�n aproximada.
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
title('M�todo de rk4');
grid on;
legend('Curva real','Curva Aproximada');