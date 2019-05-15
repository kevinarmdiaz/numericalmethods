clc
clear
syms x
f=input('DIGITE LA FUNCIÓN f=');
ezplot(f), grid on
a=input('PTO INICIAL DONDE SE BUSCA LA RAIZ xo= ');
Df=diff(f,x);
x=a;
fa=eval(f);
if fa==0 
    fprintf('LA RAIZ ES =%10.10f',a)
    break
end
tol=input('TOLERANCIA tol= ');
while tol<0
    fprintf('LA TOLERANCIA TIENE QUE SER POSITIVA')
    tol=input('TOLERANCIA tol= \n');
end
Dfa=eval(Df);
b=(a-((fa)/(Dfa)));
x=b;
fb=eval(f);
if fb==0 
    fprintf('LA RAIZ ES =\%10.10f',c)
    break
end
n=2;
fprintf('n              b                    fb                 b-a \n')
fprintf('%4.0f        %10.10f        %10.10f       %10.10f      \n',n,b,fb,b-a)
while abs(b-a)>tol
    a=b;
    x=a;
    fa=eval(f);
    Dfa=eval(Df);
    b=(a-((fa)/(Dfa)));
    x=b;
    fb=eval(f);
    n=n+1;
    fb=eval(f);
    if fb==0
        fprintf('LA RAIZ ES =\%10.10f',c)
    break
    end
    fprintf('%4.0f        %10.10f        %10.10f       %10.10f      \n',n,b,fb,b-a)
end
if abs(b-a)<tol
    fprintf('LA RAÍZ APROXIMADA ES = %10.10f NUMERO DE ITERACIONES n=%4.0f \n',b,n);
end

