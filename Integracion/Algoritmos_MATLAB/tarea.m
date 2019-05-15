
clear all 
close all
clc

%inicializacion de variable
syms x;
syms a;
cR=0;
cE=0;
cM=0;
cD=0;
z=0;

k=input('Ingrese el orden: ');


for i=0:1:k
   %resta
   r = x - a;
   cR=cR+1;
   %exponenciacion
   e=((r)^i);
   cE=cE+1;
   %multiplicacion
   m=factorial(i);
   cM=cM+1;
   %division
   d= ((x-a)^i)/(m);
   cD=cD+1;
 
   
   disp('El valor de la sumatoria en la posicion: ')
   disp (i)
   disp('es: ')
   disp(d)
end

disp('El numero de restas es');
disp(cR);
disp('El numero de veces que se elevo a una k potencia es');
disp(cE);
disp('El numero de productos es');
disp(cM);
disp('El numero de divisiones es');
disp(cD)
