clear all
clc
% % •	Cuadratura de Gauss
disp('*************************************************************************************');
disp('*******************************Calculo de Regla de cuadratura de gauss*******************************');
disp('*************************************************************************************');
syms x;
funcion=input('Ingrese la función F(x):  ');
a=input('Ingrese el punto a, límite inferior :  ');
b=input('Ingrese el punto b, límite superior :  ');
n=input('Ingrese coeficiente del  método  n  :  ');
%% Convertimos la función escrita como texto a un modo que matlab la entienda
f=inline(char(funcion));
%% Calculamos el tamaño de paso h
h=(b-a)/(2);
%% Debemos de calcular el polinomio de Legendre  a n puntos. 
%% Definimos P0 y P1;
P0=1;P1=x;
P=[P0 P1];
%% Hallamos el polinomio de Legendre  de grado n.
for j=3:n+1
    Indice=j-1;
    P(j)=(((2*Indice-1)*x)/Indice)*P(j-1)-((Indice-1)/Indice)*P(j-2);
end
%% Obtenemos el polinimio grado n del vector resultante y lo convetimos a inline
P=simplify(P);
PolinomioLegendre=P(n+1);
%% Hallamos su derivada.
DPl=diff(PolinomioLegendre,x);
DerivadaPolinomioLegendre=inline(char(DPl));
SumatoriaGauss=0;
%% Calculamos el método de gauss
%% Calculamos xi=ceros de los polinomios 
%% Convertimos la función a polinomio para obtener sus raíces con la funcion sym2Poly
PolinomioLegendre=sym2poly(PolinomioLegendre);
xi=roots(PolinomioLegendre);
for i=1:n
    %% Hallamos los pesos Wk de cada Xk
    Wi(i)=2/((1-xi(i)^2)*(DerivadaPolinomioLegendre(xi(i)))^2);
    SumatoriaGauss=Wi(i)*f((((b-a)/2))*xi(i)+((a+b)/2))+SumatoriaGauss;
end
  CuadraturaG=h*SumatoriaGauss;
  fprintf('Integral de %s \nCalculada con el método de gauss con n= %i \nEn el intervalo [%i %i] =%f\n',char(funcion),n,a,b,CuadraturaG);
  





