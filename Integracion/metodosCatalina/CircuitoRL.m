y=1;
while y==1%menu para realizar el metodo
clear all
clc
opcion = input('Digite 1 para sacar grafica con h = 0.1 ,2 para h = 0.01 ,3 para h = 0.001 o 4 para salir : ' );
%Aplicacion Circuito
% Condicion inicial 
Corriente(1)=0;
 switch opcion  
    case 1
        h=0.002;% Saltos o pasos
        n=(0-(-0.02))/h;%Numero de puntos
        T=0:h:0.02;% Tiempo de la grafica
        y=1;%condicion para seguir en el menu
        i=1;
        while i <= n%ciclo del tama?o de los puntos
          Corriente(i+1)=Corriente(i)+(h*(300-500*Corriente(i)));%metodo de euler
          i=i+1;%incremento de el while
        end
        plot(T,Corriente,'.-');%Grafica t vs corriente
        title(' Tiempo vs Corriente con h = 0.002');%titulo en la grafica
        grid on;
    case 2
        h=0.001;% Saltos o pasos
        n=(0-(-0.02))/h;%Numero de puntos
        T=0:h:0.02;%Tiempo de la grafica
        i=1;
        y=1;%condicion para seguir en el menu
        while i <= n
          Corriente(i+1)=Corriente(i)+(h*(300-500*Corriente(i)));%metodo de euler
          i=i+1;%incremento de el while
        end
        plot(T,Corriente,'.-');%Grafica t vs corriente
        title(' Tiempo vs Corriente con h = 0.001');%titulo en la grafica
        grid on;
    case 3
        h=0.0001;% Saltos o pasos
        n=(0-(-0.02))/h;%%Numero de puntos
        T=0:h:0.02;% Tiempo de la grafica
        i=1;
        y=1;%condicion para seguir en el menu
        while i <= n
          Corriente(i+1)=Corriente(i)+(h*(300-500*Corriente(i)));%metodo de euler
          i=i+1;%incremento de el while
        end
        plot(T,Corriente,'.-');%Grafica t vs corriente
        title(' Tiempo vs corriente con h = 0.0001');%titulo en la grafica
        grid on;
        
     case 4 
         
         y=2;%condicion del ruptura del menu
         disp('Gracias por usar el programa')
 end
end