clear all
clc
% % •	Regla del Trapecio
disp('*************************************************************************************');
disp('*******************************Calculo de trapecio*******************************');
disp('*************************************************************************************');
syms x;
funcion=input('Ingrese la función F(x):  ');
a=input('Ingrese el punto a, límite inferior :  ');
b=input('Ingrese el punto b, límite superior :  ');
n=input('Ingrese subdivision de intervalo n  :  ');
%% Convertimos la función escrita como texto a un modo que matlab la entienda
f=inline(char(funcion));
%% Calculamos el tamaño de paso h
h=(b-a)/(n);
i=0;Sumatoria=0;

%% Calculamos sumatoria

while(i<n)
    xi=a+i*h;
    Sumatoria=f(xi)+Sumatoria;
    fprintf('iteracion n=%i  x%i=%.6f f(x%i)=%.6f  \n',i,i,xi, i,f(xi))
    i=i+1;
end
   Trapecio=(h/2)*((f(a)+2*Sumatoria+f(b)));
   fprintf('Integral de %s \nCalculada con el método de trapecio compuesto con %i subintervalos\nEn el intervalo [%i %i] =%f\n',char(funcion),n,a,b,Trapecio);

   


