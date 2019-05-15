clear all
clc
% % •	Regla de simpson (3/8)
disp('*************************************************************************************');
disp('*******************************Calculo de Regla de simpson 3/8*******************************');
disp('*************************************************************************************');
syms q;
funcion=input('Ingrese la función P(q):  ');
a=input('Ingrese el punto a, límite inferior :  ');
b=input('Ingrese el punto b, límite superior :  ');
%% Convertimos la función escrita como texto a un modo que matlab la entienda
f=inline(char(funcion));
n=1;
while mod(n,3)~=0
     n=input('Ingrese subdivision de intervalo n  :  ');
    if mod(n,3)~=0
        fprintf('n=%i no es múltiplo de 3: ',n);
        disp('El número de subdivisiones debe ser múltiplo de 3.');
    end
end
%% Calculamos el tamaño de paso h
h=(b-a)/(n);
Sumatoria1=0;Sumatoria2=0;Sumatoria3=0;
%% Realizamos la sumatoria de indices i=1,4,7,9...
i=1;
while(i<n)
 xi=a+i*h;
 Sumatoria1=f(xi)+Sumatoria1;
 i=i+3;
end
i=2;
%% Realizamos la sumatoria de indices i=2,5,8...
while(i<n)
 xi=a+i*h;
 Sumatoria2=f(xi)+Sumatoria2;
 i=i+3;
end
i=3;
%% Realizamos la sumatoria de indices i=3,6,9...
while(i<n)
 xi=a+i*h;
 Sumatoria3=f(xi)+Sumatoria3;
 i=i+3;
end
Simpson38=(3*h/8)*(f(a)+3*Sumatoria1+3*Sumatoria2+2*Sumatoria3+f(b));
fprintf('Integral de %s \nCalculada con el método de simpson compuesto (3/8) con %i subintervalos\nEn el intervalo [%i %i] =%f\n',char(funcion),n,a,b,Simpson38);


