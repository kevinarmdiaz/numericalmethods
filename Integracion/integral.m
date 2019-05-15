clc
clear
syms x
display('1. Integral simple')
    display('Escoja el método a utilizar:')
    display('1. Método del trapecio')
    display('2. Método de Simpson 1/3')
    display('3. Método de Simpson 3/8')
    display('4. Método de cuadratura de gauus con n=2')
    c1=input('Elija una opción: ');
    if c1==1
        f=input('Ingrese la función a integrar: ');
        lim=input('Ingrese los límites de integración en forma de vector: ');
        a=lim(1);%% limite inferior del intervalo
        b=lim(2);%% limite superior del intervalo
        n=input('Ingrese el valor de n: ');
        h=(b-a)/n; %% calculamos h
        i=0;
        F=inline(char(f));
        sum=0;
        for i=1:1:n-1
            ev=a+i*h;
            sum=F(ev)+sum; %% Evalulamos en la función.
        end
        resultado=(h/2)*(F(a)+2*sum+F(b));
        display('El resultado de la integral es: ')
        format long
        resultado
    end
    if c1==2
        f=input('Ingrese la función a integrar: ');
        lim=input('Ingrese los límites de integración en forma de vector: ');
        a=lim(1);
        b=lim(2);
        n=input('Ingrese el valor de n (debe ser par): ');
        h=(b-a)/n;
        i=0;
        F=inline(char(f));
        sum1=0;
        sum2=0;
        k=n/2;
        for i=1:1:k
            ev=a+(2*i-1)*h;
            sum1=F(ev)+sum1; %% evaluamos en la función. la suma
        end
        for i=1:1:k-1
            ev=a+2*i*h;
            sum2=F(ev)+sum2;
        end
        resultado=(h/3)*(F(a)+4*sum1+2*sum2+F(b));%% Sumatoria de simpson 1/3
        display('El resultado de la integral es: ')
        format long
        resultado
    end
    if c1==3
        f=input('Ingrese la función a integrar: ');
        lim=input('Ingrese los límites de integración en forma de vector: ');
        a=lim(1);
        b=lim(2);
        n=input('Ingrese el valor de n (debe ser múltiplo de 3): ');
        h=(b-a)/n;
        i=0;
        F=inline(char(f));
        sum1=0;
        sum2=0;
        k=n/3;
        for i=0:1:k-1
            ev1=a+(3*i+1)*h;
            ev2=a+(3*i+2)*h;
            sum1=F(ev1)+F(ev2)+sum1;
        end
        for i=1:1:k-1
            ev=a+3*i*h;
            sum2=F(ev)+sum2;
        end
        resultado=((3*h)/8)*(F(a)+3*sum1+2*sum2+F(b));
        display('El resultado de la integral es: ')
        format long
        resultado
    end
    if c1==4
          F=input('Ingrese la función a integrar: ');
        lim=input('Ingrese los límites de integración en forma de vector: ');
        a=lim(1);
        b=lim(2);
        % Los xi serán para un n=2;
        x1=sqrt(1/3);
        x2= -sqrt(1/3);
        f=inline(char(F));
        t1=(a+b)/2+(b-a)/2*x1;
        t2=(a+b)/2+(b-a)/2*x2;
        resultado=(f(t1)+f(t2))*(b-a)/2;
        display('El resultado de la integral es: ')
        format long
        resultado
    end
