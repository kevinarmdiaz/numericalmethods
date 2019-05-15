
%**************************************************************** 
%** Calculo de la integral por el                              ** 
%** Metodo de Simpson 1/3 de multiples                         ** 
%** segmentos                                             UdeG ** 
%**                                    Maestria en Electronica ** 
%** Ing. Jesus Norato Valencia                                 ** 
%** Materia: Metodos Numericos                                 ** 
%** Maestro: M.C. J.Gilberto Mateos Suarez           26/Nov/99 ** 
%**************************************************************** 
 

clear; 
clc; 
fprintf('Calculo de la integral por el metodo de Simpson de 1/3\n\n'); 
f=input('introduce la funcion:','s'); 
a=input('lime inferior:'); 
b=input('limite superior:'); 
c=input('numero de segmentos a dividir (numero par):'); 
h=(b-a)/c; 
 

%***************************************************************** 
%** En la siguiente seccion se realiza la sumatoria             ** 
%** de cada una de las evaluaciones impares de la funcion       ** 
%*****************************************************************

z=0; 
x=a; 
for i=1:c;

if (-1)^i==1
k=eval(f);

z=z+k;

end

x=h*i;

end 
  
 
%***************************************************************** 
%** En la siguiente seccion se realiza la sumatoria             ** 
%** de cada una de las evaluaciones pares de la funcion         ** 
%***************************************************************** 
  
 

zz=0; 
x=a; 
for i=2:c;

if (-1)^i==-1
k=eval(f);
zz=zz+k;

end
x=h*i;

end 
  
 
%***************************************************************** 
%** En la siguiente seccion se realiza la evaluacion de         ** 
%** el primero y el ultimo valor a evaluar en la funcion        ** 
%***************************************************************** 
  
 

x=a; 
if x==a

d=eval(f);
end
x=b;

if x==b

e=eval(f);
end 
  
 
%***************************************************************** 
%** una vez que se tienen los datos de areas bajo la curva      ** 
%** se realizan las operaciones directamente en la formula de   ** 
%** integracion por el metodo de simpson de 1/3.                ** 
%***************************************************************** 
  
 

z=z*4; 
v=zz*2; 
z=z+v+d+e; 
z=z/(3*c); 
z=z*(b-a) 
fprintf('Resultado '); 