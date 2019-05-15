clc
clear all;
a=0;%valor del extremo inferior del intervalo.
b=2;%valor del extremo superior del intervalo.
h=0.1;%valor de h 0.1s
N=(b-a)/h;% tamaño de paso.
g=32.17;L=2;%%Valores de g & L del problema.
f1='v';%% x1(t)=x;
f2='-(g/L)*sin(thetha)';
thethaf1(1)=pi/6;
thethaf2(1)=0;
for i=1:N
    v=thethaf1(i);
    thetha=thethaf2(i);
    funcion1=eval(f1);
    funcion2=eval(f2);
    %% k1
    k1f1=funcion1;
    k1f2=funcion2;
    %% k2 
    v=thethaf1(i)+(1/2)*h*k1f1;
    thetha=thethaf2(i)+(1/2)*h*k1f2;
    funcion1=eval(f1);
    funcion2=eval(f2);
    k2f1=funcion1;
    k2f2=funcion2;
    %% k3
    v=thethaf1(i)+(1/2)*h*k2f1;
    thetha=thethaf2(i)+(1/2)*h*k2f2;
    funcion1=eval(f1);
    funcion2=eval(f2);
    k3f1=funcion1;
    k3f2=funcion2;
    %% k4 
    v=thethaf1(i)+h*k3f1;
    thetha=thethaf2(i)+h*k3f2;
    funcion1=eval(f1);
    funcion2=eval(f2);
    k4f1=funcion1;
    k4f2=funcion2;
    %% Solucion 
    thethaf1(i+1)=thethaf1(i)+(1/6)*(k1f1+2*(k2f1+k3f1)+k4f1)*h;
    thethaf2(i+1)=thethaf2(i)+(1/6)*(k1f2+2*(k2f2+k3f2)+k4f2)*h;
end
 t=a:h:b;%% intervalo de tiempo
 figure(1)
 hold on
 plot(t,thethaf1,'r')
 xlabel('t');
 ylabel('thetha'); 
