clear all
clc
fprintf('Método de Runge-Kutta \n')
fprintf('Ingrese "a"  el valor extremo inferior para t')
a=input(': ');
fprintf('\nSeleccione una opción: \n1 - Posee "b" un valor extremo superior para t  y "N" un número de divisiones para el intervalo delimitado \n por "a", el valor extremo inferior de t y "b", el valor extremo superior de t')
fprintf('\n2 - Posee un valor de h (recuerde que h suele ser (b-a)/N), y un número N de divisiones para el intervalo\n')
selec=input(': ');
switch selec
    case 1
    fprintf('\nIngrese el valor extremo superior')
    b=input(': ');
    fprintf('\nIngrese el número de intervalos')
    N=input(': ');
    h=(b-a)/N;
    case 2
    fprintf('\nIngrese el valor de h')
    h=input(': ');
    fprintf('\nIngrese el número de intervalos')
    N=input(': ');
end

fprintf('\nIngrese el número de ecuaciones')
m=input(': ');


for i=1:m
    fprintf('\nIngrese la ecuación %i en términos t y wi. \nEjemplo: t - 5*w1.^2 + 8*w2.^4  Recuerde colocar "." antes de elevar a una potencia\n',i)
    ecu=input(': ','s');
    ecu=strcat('@(t,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15) ',ecu);
    assignin('base',(char(strcat('f',num2str(i))+0)),str2func(ecu))
    fprintf('\nIngrese la condición inicial de la ecuación %i\n',i)
    alpha(i)=input(': ');
end

t=a;
w=zeros(1,15);
k=zeros(1,15);
for j=1:m
    w(j)=alpha(j);
end
for i=1:N
    for j=1:m;
        evalin('base',strcat(char(strcat('vf',num2str(j))+0),'=feval(',char(strcat('f',num2str(j))+0),',t,w(1),w(2),w(3),w(4),w(5),w(6),w(7),w(8),w(9),w(10),w(11),w(12),w(13),w(14),w(15));'))
        evalin('base',strcat('k(1,j)=h*',char(strcat('vf',num2str(j))+0)))
    end
    for j=1:m
        evalin('base',strcat(char(strcat('vf',num2str(j))+0),'=feval(',char(strcat('f',num2str(j))+0),',t+(h/2),w(1)+(1/2)*k(1,1),w(2)+(1/2)*k(1,2),w(3)+(1/2)*k(1,3),w(4)+(1/2)*k(1,4),w(5)+(1/2)*k(1,5),w(6)+(1/2)*k(1,6),w(7)+(1/2)*k(1,7),w(8)+(1/2)*k(1,8),w(9)+(1/2)*k(1,9),w(10)+(1/2)*k(1,10),w(11)+(1/2)*k(1,11),w(12)+(1/2)*k(1,12),w(13)+(1/2)*k(1,3),w(14)+(1/2)*k(1,14),w(15)+(1/2)*k(1,15));'))
        evalin('base',strcat('k(2,j)=h*',char(strcat('vf',num2str(j))+0)))    
    end
    for j=1:m
        evalin('base',strcat(char(strcat('vf',num2str(j))+0),'=feval(',char(strcat('f',num2str(j))+0),',t+(h/2),w(1)+(1/2)*k(2,1),w(2)+(1/2)*k(2,2),w(3)+(1/2)*k(2,3),w(4)+(1/2)*k(2,4),w(5)+(1/2)*k(2,5),w(6)+(1/2)*k(2,6),w(7)+(1/2)*k(2,7),w(8)+(1/2)*k(2,8),w(9)+(1/2)*k(2,9),w(10)+(1/2)*k(2,10),w(11)+(1/2)*k(2,11),w(12)+(1/2)*k(2,12),w(13)+(1/2)*k(2,3),w(14)+(1/2)*k(2,14),w(15)+(1/2)*k(2,15));'))
        evalin('base',strcat('k(3,j)=h*',char(strcat('vf',num2str(j))+0)))    
    end
    for j=1:m
        evalin('base',strcat(char(strcat('vf',num2str(j))+0),'=feval(',char(strcat('f',num2str(j))+0),',t+h,w(1)+k(3,1),w(2)+k(3,2),w(3)+k(3,3),w(4)+k(3,4),w(5)+k(3,5),w(6)+k(3,6),w(7)+k(3,7),w(8)+k(3,8),w(9)+k(3,9),w(10)+k(3,10),w(11)+k(3,11),w(12)+k(3,12),w(13)+k(3,3),w(14)+k(3,14),w(15)+k(3,15));'))
        evalin('base',strcat('k(4,j)=h*',char(strcat('vf',num2str(j))+0)))    
    end
    for j=1:m
        w(j)=w(j)+(k(1,j)+2*k(2,j)+2*k(3,j)+k(4,j))/6;
    end
    t=a+i*h;
    for j=1:m
    fprintf('El valor de w%i para t=%6.2f es: %9.8f \n',j,t,w(j))
    end
end