%METODO DE EULER MZH
%METODO DE SOLUCION PARA ECUACIONES DIFERENCIALES y'=f(t,y)
clc;clear all;
a=input('Ingrese el valor a: ');
b=input( 'Ingrese el valor b: ');
h=input('ingrese h: ');
n=(b-a)/h;
f=input('Ingrese la funcion f(t,y) en comillas simples: ');
yex=input('Ingrese la solucion exacta en comillas simples: ');
yex=inline(char(yex)); % solucion exacta de la ecucion 
f=inline(char(f));
yo=input('Ingrese la condicion inicial Y(a)= ');
T=a:h:b;  %el T es un vector
yeu(1)=yo; % matlab comienza a leer la posicion a partir de 1
for i=1:n
    yeu(i+1)=yeu(i)+h*f(T(i),yeu(i));
end
for i=1:n+1
    yexacta(i)=yex(T(i));
    Error(i)=abs(yeu(i)-yexacta(i));
end

plot(T,yeu,'r',T,yexacta,'g');                 %graficamos por parejas, la r es para poner el comolr rojo, la grafica las otras funciones 
xlabel('Tiempo')
ylabel('Y')
title('Euler')
legend('Euler', 'Exacta')                 %la legend identifica las curvas de las ecuaciones  
figure                                    %figure sirve opara que no se borre la grafica anterior
plot(Error,'*')



