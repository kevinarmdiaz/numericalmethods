clear all
clc
% % •	Regla de simpson (1/3)
disp('*************************************************************************************');
disp('*******************************Calculo de Regla de simpson 1/3*******************************');
disp('*************************************************************************************');
syms q;
funcion=input('Ingrese la función P(q):  ');
a=input('Ingrese el punto a, límite inferior :  ');
b=input('Ingrese el punto b, límite superior :  ');
n=input('Ingrese los subintervalos n :');
%% Calculo para simpson (1/3)
%% Convertimos la función escrita como texto a un modo que matlab la entienda
f=inline(char(funcion));
%% Calculamos el tamaño de paso h
h=(b-a)/(n);
SumatoriaImpares=0;SumatoriaPares=0;
%% Realizamos la sumatoria de indices pares e impares.
i=1;
while(i<n)
    xi=a+i*h;
    if(mod(i,2)==0)
    SumatoriaPares=f(xi)+SumatoriaPares;
    else
    SumatoriaImpares=f(xi)+SumatoriaImpares;
    end
    i=i+1;
    fprintf('iteracion n=%i  x%i=%.6f f(x%i)=%.6f  \n',i,i,xi, i,f(xi))
end
Simpson13=(h/3)*(f(a)+4*SumatoriaImpares+2*SumatoriaPares+f(b));

 fprintf('Integral de %s \nCalculada con el método de simpson compuesto (1/3) con %i subintervalos\nEn el intervalo [%i %i] =%.16f\n',char(funcion),n,a,b,Simpson13);
 %% Calculo para simpson (1/3)
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
IntegralReal=866.667;
%%Comparamos el error de cada método frente la solución real de la integral
EaTresOctavos=abs(IntegralReal-Simpson38);
EaUnTercio=abs(IntegralReal-Simpson13);
fprintf('Error de simpson 3/8=%f',EaTresOctavos);
fprintf('\n Error de simpson 1/3=%f',EaUnTercio);
%% Se calcula el excendete el consumidor
ExcendenteConsumidor=EaTresOctavos-(80)*(90);
fprintf('\n El excedente del consumidor es =%f',ExcendenteConsumidor);




