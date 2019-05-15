clc
clear
%CEROS DE FUNCIONES POR EL METODO DE LA SECANTE
syms x
f=input('DIGITE LA FUNCIÓN f=');
ezplot(f), grid on
%A=input('INTERVALO DONDE SE BUSCA LA RAIZ ENTRE CORCHETES');
a=input('digite el x0= ');
b=input('digite el x1= ');
x=a;
fa=eval(f);
x=b;
fb=eval(f);
% while fa*fb>0
%     fprintf('EN ESTE INTERVALO NO HAY CAMBIO DE SIGNO, ENTRE UN NUEVO INTERVALO')
%     A=input('INTERVALO DONDE SE BUSCA LA RAIZ ENTRE CORCHETES');
%     a=A(1,1);
%     b=A(1,2);
%     x=a;
%     fa=eval(f);
%     x=b;
%     fb=eval(f);
% end
% if a>b
%     aux=a;
%     a=b;
%     b=aux;
%     fprintf('EL INTERVALO SE CAMBIO DE MENOR A MAYOR \n')
%end
if fa==0 
    fprintf('LA RAIZ ES =\%10.10f',a)
    break
end
if fb==0 
    fprintf('LA RAIZ ES =\%10.10f',b)
    break
end
tol=input('TOLERANCIA tol= ');
while tol<0
    fprintf('LA TOLERANCIA TIENE QUE SER POSITIVA')
    tol=input('TOLERANCIA tol= \n');
end
a;
b;
c=b-((b-a)*fb)/(fb-fa);
x=c;
fc=eval(f);
if fc==0 
    fprintf('LA RAIZ ES =\%10.10f',c)
    break
end
n=2;
fprintf('n             c                    fc                \n')
fprintf('%4.0f       %10.10f        %10.10f             \n',n,c,fc)
while abs(fc)>tol 
    a=b; fa=fb;
    b=c; fb=fc;
%      if fa*fc<0
%         b=c;
%         fb=fc;
%     else
%         a=c;
%         fa=fc;
%     end
    n=n+1;
    c=b-((b-a)*fb)/(fb-fa);
    x=c;
    fc=eval(f);
    fprintf('%4.0f       %10.10f        %10.10f          \n',n,c,fc)
end
if abs(fc)<tol
    fprintf('LA RAÍZ APROXIMADA ES = %10.10f NUMERO DE ITERACIONES n=%4.0f \n',c,n);
end