%Ceros de funciones por el método de Punto Fijo
clc
clear
fprintf('\nMÉTODO DEL PUNTO FIJO \n')
syms x
f=input('Digite la función f= ');
ezplot(x)
ezplot(f), grid on
g=input('Digite la función g= ');
ezplot(g), grid on, hold on
%ezplot(f), grid on, hold on,
x0=input('Ingrese el valor inicial x0= ');
tol=input('Ingrese la tolerancia tol= ');
while tol<0
    fprintf('La tolerancia tiene que ser positiva')
    tol=input('Ingrese la tolerancia tol= \n');
end
NI=input('Ingrese el número máximo de iteraciones: ');
while NI<0
    fprintf('El número máximo de iteraciones tiene que ser positivo')
    NI=input('Ingrese el número máximo de iteraciones: \n');
end
x=x0;
f0=eval(f);
x1=eval(g);
n=0;
sw=0;
sw1=-1;
x=x1;
f1=eval(f);
fprintf('%4.0f      %10.10f       %10.10f     \n',n,x0,f0)
fprintf('%4.0f      %10.10f       %10.10f     %10.10f    \n',n,x1,f1,abs(x1-x0))
while abs(x1-x0)>tol & NI>n
    x0=x1;
    x=x0;
    f0=eval(f);
    x1=eval(g);
    x=x1;
    f1=eval(f);
    ireal=isreal(x1);
    if ireal==0
        sw1=0;
        break
    end        
    n=n+1;
    fprintf('%4.0f      %10.10f       %10.10f     %10.10f \n',n,x1,f1,abs(x1-x0))
    is=isnan([x0,f0]);
    s=is(1,1)+is(1,2);
    if s>0
        sw=1;
        break
    end
end
if sw==1
    fprintf('El algoritmo diverge\n')
end
if sw1==0
    fprintf('El algoritmo tiene valores imaginarios\n')
end