%Ceros de funciones por el m�todo de Punto Fijo
clc
clear
fprintf('\nM�TODO DEL PUNTO FIJO \n')
syms x
f=input('Digite la funci�n f= ');
ezplot(x)
ezplot(f), grid on
g=input('Digite la funci�n g= ');
ezplot(g), grid on, hold on
%ezplot(f), grid on, hold on,
x0=input('Ingrese el valor inicial x0= ');
tol=input('Ingrese la tolerancia tol= ');
while tol<0
    fprintf('La tolerancia tiene que ser positiva')
    tol=input('Ingrese la tolerancia tol= \n');
end
NI=input('Ingrese el n�mero m�ximo de iteraciones: ');
while NI<0
    fprintf('El n�mero m�ximo de iteraciones tiene que ser positivo')
    NI=input('Ingrese el n�mero m�ximo de iteraciones: \n');
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