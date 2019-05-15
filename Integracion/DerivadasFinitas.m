clear all
clc
% % Esquemas de Diferencias Finitas Adelante, Atrás y Central para la Primera y segunda derivada
disp('*************************************************************************************');
disp('*******************************Calculo de diferencias finitas*******************************');
disp('*************************************************************************************');
syms x;
funcion=input('Ingrese la función F(x):  ');
x0=input('Ingrese el punto x0 a calcular:  ');
h=input('Ingrese tamaño de paso (h):  ');

%% Convertimos la función escrita como texto a un modo que matlab la entienda
f=inline(char(funcion));
%% Derivamos la funcion
DerivadaF=diff(funcion,x);
DerivadaF2=diff(DerivadaF,x);
Df=inline(char(DerivadaF));%Primera Derivada
Df2=inline(char(DerivadaF2));% Segunda Derivada
%% Primera Derivada  diferencias finitas progresivas.
Dfprimera2PuntosP=(f(x0+h)-f(x0))/h
Dfprimera3PuntosP=(-3*f(x0)+4*f(x0+h)-f(x0+2*h))/(2*h)
%% Primera Derivada  diferencias finitas centradas.
Dfprimera2PuntosC=(f(x0+h)-f(x0-h))/(2*h)
Dfprimera4PuntosC=(f(x0-2*h)-8*f(x0-h)+8*f(x0+h)-f(x0+2*h))/(12*h)
%% Primera Derivada  diferencias finitas regresivas.
Dfprimera2PuntosR=(f(x0)-f(x0-h))/(h)
Dfprimera3PuntosR=(f(x0-2*h)-4*f(x0-h)+3*f(x0))/(2*h)
%% Calculamos la derivada real.
DerivadaReal=Df(x0);
%% Errores
PrimeraDerivadaAproximada=[Dfprimera2PuntosP Dfprimera3PuntosP Dfprimera2PuntosC Dfprimera4PuntosC Dfprimera2PuntosR Dfprimera3PuntosR]
ErrorAbsoluto=abs(PrimeraDerivadaAproximada-DerivadaReal)
ErrorRelativo=(ErrorAbsoluto/DerivadaReal)*100;
%% Segunda derivada.
%% Segunda derivada->  diferencias finitas progresivas.
DfSegunda3PuntosP=(f(x0)-2*f(x0+h)+f(x0+2*h))/(h^2)
DfSegunda4PuntosP=(2*f(x0)-5*f(x0+h)+4*f(x0+2*h)-f(x0+3*h))/(h^2)
%% Segunda derivada->  diferencias finitas centradas.
DfSegunda3PuntosC=(f(x0-h)-2*f(x0)+f(x0+h))/(h^2)
DfSegunda5PuntosC=(-f(x0-2*h)+16*f(x0-h)-30*f(x0)+16*f(x0+h)-f(x0+2*h))/(12*h^2)
%% Segunda derivada->  diferencias finitas regresivas.
DfSegunda3PuntosR=(f(x0-2*h)-2*f(x0-h)+f(x0))/(h^2)
DfSegunda4PuntosR=(-f(x0-3*h)+4*f(x0-2*h)-5*f(x0-h)+2*f(x0))/(h^2)
%% Calculamos la derivada real.
DerivadaSegundaReal=Df2(x0)
SegundaDerivadaAproximada=[DfSegunda3PuntosP DfSegunda4PuntosP DfSegunda3PuntosC DfSegunda5PuntosC DfSegunda3PuntosR DfSegunda4PuntosR]
ErrorAbsoluto2=abs(SegundaDerivadaAproximada-DerivadaSegundaReal)