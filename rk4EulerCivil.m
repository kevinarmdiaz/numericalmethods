%%  Rk4 vectorial
clc; clear all;close all; %Cerramos ventanas y limpiamos variables.
syms  var_u var_y 
format long
opcion=1;
ultimoDato=0;
while(opcion~=0)
    
    disp('Digite: 1 si desea calcular la EDO por Método de runge kutta orden 4');
    disp('Digite: 2 si desea calcular la EDO por Método de euler');
    disp('Digite: 0 si desea salir del programa ');
    opcion=input('');
    
    if(ultimoDato~=1)
    m=input('Digite la masa total del techo [m]: ');
    E=input('Digite el módulo de elasticidad de las columna [E]: ');
    I=input('Digite el momento de inercia de las columnas [I]: ');
    hcolumna=input('Digite longitud de las columnas [hcol]: ');
    h=input('Digite longitud del intervalo [h]: ');
    a=input('Ingrese valor inicial de intervalo [a]: ');
    b=input('Ingrese valor final de intervalo [b]: ');
    u0=input('Digite condición inicial u(0): ');
    u1=input('Digite condición inicial u''(0): ');
    k=(E*I)/h^2;
    uprima=inline('var_y',char(var_u),char(var_y));
    yprima=inline(char((-k*var_u)/m),char(var_u),char(var_y));
    n=(b-a)/h;
    u=zeros(1,n);
    y=zeros(1,n);
    u(1)=u0; y(1)=u1;
    ejeX=a:h:b;
    end
   
    
    switch opcion
        case 1
            %% método de runge kutta!
            for i=2:n+1
                k1(1,1)=h*uprima(u(i-1),y(i-1));
                k1(2,1)=h*yprima(u(i-1),y(i-1));
                k2(1,1)=h*uprima(u(i-1)+k1(1,1)/2,y(i-1)+k1(2,1)/2);
                k2(2,1)=h*yprima(u(i-1)+k1(1,1)/2,y(i-1)+k1(2,1)/2);
                k3(1,1)=h*uprima(u(i-1)+k2(1,1)/2,y(i-1)+k2(2,1)/2);
                k3(2,1)=h*yprima(u(i-1)+k2(1,1)/2,y(i-1)+k2(2,1)/2);
                k4(1,1)=h*uprima(u(i-1)+k3(1,1),y(i-1)+k3(2,1));
                k4(2,1)=h*yprima(u(i-1)+k3(1,1),y(i-1)+k3(2,1));
                u(i)=u(i-1)+(1/6)*(k1(1,1)+2*k2(1,1)+2*k3(1,1)+k4(1,1));
                y(i)=y(i-1)+(1/6)*(k1(2,1)+2*k2(2,1)+2*k3(2,1)+k4(2,1));
            end
            %% graficamos 
            figure;
            ax1 = subplot(2,1,1); 
            title('u vs y=u''');
            plot(ax1,u,y,'--');xlabel('u');ylabel('y=u'''); 
            grid on
            ax2 = subplot(2,1,2);
            title('u');
            plot(ax2,ejeX,u,'--');xlabel('x');ylabel('u'); 
            grid on
        case 2
            %% método de euler!
            for i=2:n+1
                k1(1,1)=h*uprima(u(i-1),y(i-1));
                k1(2,1)=h*yprima(u(i-1),y(i-1));
                u(i)=u(i-1)+h*(k1(1,1));
                y(i)=y(i-1)+h*(k1(2,1));
            end
            figure;
            ax1 = subplot(2,1,1); 
            title('u vs y=u''');
            plot(ax1,u,y,'--');xlabel('u');ylabel('y=u'''); 
            grid on
            ax2 = subplot(2,1,2);
            title('u');
            plot(ax2,ejeX,u,'--');xlabel('x');ylabel('u'); 
            grid on
            
    end
    
    
    ultimoDato=input('Digite 1: si desea usar los datos anteriores para otro método. ');
    
end
