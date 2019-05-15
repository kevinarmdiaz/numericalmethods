% metodo de solucion de ODE - Presa depredador
% metodo de euler 
%   Problema 
% x1'(t)=k1*x1(t)-k2*x1(t)x2(t)
% x2'(t)=k3*x1(t)x2(t)-k4*x2(t)
% 0<=t<=200;
% y'= f(t,x,y)
% dado y(yto)=yo;
clc
clear all;
close all;
a=0;%valor del extremo inferior del intervalo.
b=200;%valor del extremo superior del intervalo.
N=1000000;% Valor arbitrario de subintervalos.
h=(b-a)/N;% tamaño de paso.
K1=3;K2=0.002;K3=0.0006;K4=0.5;%%Valores de K del problema.
fpresa='K1*x-K2*x*y';%% x1(t)=x;
fdepredador='K3*x*y-K4*y';%% x2(t)=y;
YPresa(1)=1000;
YDepredador(1)=500;
for i=1:N
    x=YPresa(i);
    y=YDepredador(i);
    funcionpresa=eval(fpresa);%% se usa para eval para evaluar las funciones.
    funcionDepredador=eval(fdepredador);
    %% k1
    k1Presa=h*funcionpresa;
    k1Depredador=h*funcionDepredador;
    %% Solucion 
    YPresa(i+1)=YPresa(i)+k1Presa;
    YDepredador(i+1)=YDepredador(i)+k1Depredador;
end
 t=a:h:b;%% intervalo de tiempo
 figure(1)
 subplot(2,1,1);
 hold on
 plot(t,YPresa,'r')
 plot(t,YDepredador,'b')
 title('Población de presa en rojo y Depredador en azul contra el tiempo');
 subplot(2,1,2); 
 plot(YPresa,YDepredador,'y')
 title('Población de presa contra la de depredador');
 xlabel('presa');
 ylabel('depredador'); 
 
