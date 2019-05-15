clear
clc
syms x
f=input('digite funcion F=');
i=input('digite el intervalo a trabajar en vector de una fila I= ');
tol=input('diigte la tolerencia tol= ');
N=input('digite el numero maximo de iteracciones= ');
a=i(1,1);
b=i(1,2);
F=inline(char(f));
if F(a)==0
    fprintf('Un cero de F es=%f \n',a)
    break
end
if F(b)==0
    fprintf('Un cero de F es=%f \n',b)
    break
end
if F(a)*F(b)>0
    fprintf('ho hay raiz en este intervalo \n')
    break
end
n=1;
c=(a+b)/2;
fprintf('a=%f  b=%f  c=%f F(c)=%f \n',a,b,c,F(c))
while n<=N | abs(F(c))>tol
    if F(a)*F(c)<0
        b=c;
    else
        a=c;
    end
    c=(a+b)/2;
    n=n+1;
    fprintf('a=%f  b=%f  c=%f F(c)=%f \n',a,b,c,F(c))
end
fprintf('la raiz aproximada es=%e \n',c)  