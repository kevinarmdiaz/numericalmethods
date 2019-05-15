%% Temperatura de una placa calentada con condiciones de frontera fijas
clear all
clc
%% Algoritmo.
Es=0.001;
lambda=1.5;
m=5; n=5; % matriz de 3*3;
%% Creamos la matriz inicial de ceros
T=zeros(m,n);
%% Creamos las condiciones de frontera;
T(1,:)=75;
T(:,1)=0;
T(m,:)=50;
T(:,n)=100;
Ea=100;
iteraciones=0;
%% Dos bucles para calculo.
while(Ea>Es)
    for j=2:n-1 
        for i=2:m-1
            TAnterior=T(i,j);
            T(i,j)=T(i,j)+lambda*(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1)-4*T(i,j))/4;
            %% Sobrerelajación
            Ea=abs((T(i,j)-TAnterior)/(T(i,j)));
        end
    end
    iteraciones=iteraciones+1;
end
Temp=T(2:m-1,2:n-1);
Temp=transpose(Temp);
%% Impresión de resultados.
fprintf('Temperatura de la placa para un Es=%f en %i iteraciones \n',Es,iteraciones);
for i=length(Temp):-1:1
    for j=1:1:length(Temp)
        fprintf('%.4f \t',Temp(i,j));
    end
        fprintf('\n');
end
