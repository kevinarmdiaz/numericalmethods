    clc
clear
syms x
syms y
syms z
display('1. Integral simple')
display('2. Integral doble')
display('3. Integral triple')
c=input('Elija una opción: ');
if c==1
    display('Escoja el método a utilizar:')
    display('1. Método del trapecio')
    display('2. Método de Simpson 1/3')
    display('3. Método de Simpson 3/8')
    c1=input('Elija una opcción: ');
    if c1==1
        f=input('Ingrese la función a integrar: ');
        lim=input('Ingrese los límites de integración en forma de vector: ');
        a=lim(1);
        b=lim(2);
        n=input('Ingrese el valor de n: ');
        h=(b-a)/n;
        i=0;
        F=inline(char(f));
        sum=0;
        for i=1:1:n-1
            ev=a+i*h;
            sum=F(ev)+sum;
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
            sum1=F(ev)+sum1;
        end
        for i=1:1:k-1
            ev=a+2*i*h;
            sum2=F(ev)+sum2;
        end
        resultado=(h/3)*(F(a)+4*sum1+2*sum2+F(b));
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
end
if c==2
    resultado=0;
    display('Escoja el método a utilizar:')
    display('1. Método del trapecio')
    display('2. Método de Simpson 1/3')
    display('3. Método de Simpson 3/8')
    c1=input('Elija una opcción: ');
    if c1==1
        f=input('Ingrese la función f(x,y) a integrar: ');
        limx=input('Ingrese los límites de integración de x (reales) en forma de vector: ');
        a=limx(1);
        b=limx(2);
        limy=input('Ingrese los límites de integración de y (de la forma f(x)) en forma de vector: ');
        a1=limy(1);
        b1=limy(2);
        n=input('Indique el valor de n (divisiones de la integral externa): ');
        m=input('Indique el valor de m (divisiones de la integral interna): ');
        h=(b-a)/n;
        F=inline(char(f));
        % Calculando g(a)
        a11=inline(char(a1));
        a111=a11(a);
        b11=inline(char(b1));
        b111=b11(a);
        h1=(b111-a111)/m;
        x=a;
        g1=eval(f);
        g2=inline(char(g1));
        sum=0;
        for i=1:1:m-1
            ev=a111+i*h1;
            sum=g2(ev)+sum;
        end
        ga=(h1/2)*(g2(a111)+2*sum+g2(b111));
        %Calulando g(b)
        syms x
        a111=a11(b);
        b111=b11(b);
        h1=(b111-a111)/m;
        x=b;
        g1=eval(f);
        g2=inline(char(g1));
        sum=0;
        for i=1:1:m-1
            ev=a111+i*h1;
            sum=g2(ev)+sum;
        end
        gb=(h1/2)*(g2(a111)+2*sum+g2(b111));
        syms x
        %Calculando la sumatoria interna
        sumatoria=0;
        for i=1:1:n-1
           ev=a+i*h;
           a111=a11(ev);
           b111=b11(ev);
           x=ev;
           g1=eval(f);
           g2=inline(char(g1));
           hn=(b111-a111)/m;
           sum=0;
           for j=1:1:m-1
               ev1=a111+j*hn;
               sum=g2(ev1)+sum;
           end
           sumatoria=(hn/2)*(g2(a111)+2*sum+g2(b111))+sumatoria;
        end
        resultado=(h/2)*(ga+2*sumatoria+gb);
        display('El resultado de la integral es: ')
        format long
        resultado
    end
    if c1==2
        f=input('Ingrese la función f(x,y) a integrar: ');
        limx=input('Ingrese los límites de integración de x (reales) en forma de vector: ');
        a=limx(1);
        b=limx(2);
        limy=input('Ingrese los límites de integración de y (de la forma f(x)) en forma de vector: ');
        a1=limy(1);
        b1=limy(2);
        n=input('Indique el valor de n (divisiones de la integral externa): ');
        m=input('Indique el valor de m (divisiones de la integral interna): ');
        h=(b-a)/n;
        k=n/2;
        F=inline(char(f));
        % Calculando g(a)
        a11=inline(char(a1));
        a111=a11(a);
        b11=inline(char(b1));
        b111=b11(a);
        h1=(b111-a111)/m;
        x=a;
        g1=eval(f);
        g2=inline(char(g1));
        sum=0;
        sum1=0;
        k1=m/2;
        for i=1:1:k1
            ev=a111+(2*i-1)*h1;
            sum=g2(ev)+sum;
        end
        for i=1:1:k1-1
            ev=a111+2*i*h;
            sum1=g2(ev)+sum1;
        end
        ga=(h1/3)*(g2(a111)+4*sum+2*sum1+g2(b111));
        %Calulando g(b)
        syms x
        a111=a11(b);
        b111=b11(b);
        h1=(b111-a111)/m;
        x=b;
        g1=eval(f);
        g2=inline(char(g1));
        sum=0;
        sum1=0;
        k1=m/2;
        for i=1:1:k1
            ev=a111+(2*i-1)*h1;
            sum=g2(ev)+sum;
        end
        for i=1:1:k1-1
            ev=a111+2*i*h;
            sum1=g2(ev)+sum1;
        end
        gb=(h1/3)*(g2(a111)+4*sum+2*sum1+g2(b111));
        syms x
        %Calculando la sumatoria interna
        sumatoria1=0;
        sumatoria2=0;
        for i=1:1:k
           ev=a+(2*i-1)*h;
           a111=a11(ev);
           b111=b11(ev);
           x=ev;
           g1=eval(f);
           g2=inline(char(g1));
           hn=(b111-a111)/m;
           k1=m/2;
           sum=0;
           sum1=0;
           for j=1:1:k1
               ev1=a111+(2*j-1)*hn;
               sum=g2(ev1)+sum;
           end
           for j=1:1:k1-1
               ev2=a111+2*j*hn;
               sum1=g2(ev2)+sum1;
           end
           sumatoria1=(hn/3)*(g2(a111)+4*sum+2*sum1+g2(b111))+sumatoria1;
        end
        for i=1:1:k-1
           ev=a+2*i*h;
           a111=a11(ev);
           b111=b11(ev);
           x=ev;
           g1=eval(f);
           g2=inline(char(g1));
           hn=(b111-a111)/m;
           k1=m/2;
           sum=0;
           sum1=0;
           for j=1:1:k1
               ev1=a111+(2*j-1)*hn;
               sum=g2(ev1)+sum;
           end
           for j=1:1:k1-1
               ev2=a111+2*j*hn;
               sum1=g2(ev2)+sum1;
           end
           sumatoria2=(hn/3)*(g2(a111)+4*sum+2*sum1+g2(b111))+sumatoria2;
        end 
        resultado=(h/3)*(ga+4*sumatoria1+2*sumatoria2+gb);
        display('El resultado de la integral es: ')
        format long
        resultado
    end
    if c1==3
        f=input('Ingrese la función f(x,y) a integrar: ');
        limx=input('Ingrese los límites de integración de x (reales) en forma de vector: ');
        a=limx(1);
        b=limx(2);
        limy=input('Ingrese los límites de integración de y (de la forma f(x)) en forma de vector: ');
        a1=limy(1);
        b1=limy(2);
        n=input('Indique el valor de n (divisiones de la integral externa): ');
        m=input('Indique el valor de m (divisiones de la integral interna): ');
        h=(b-a)/n;
        k=n/3;
        F=inline(char(f));
        % Calculando g(a)
        a11=inline(char(a1));
        a111=a11(a);
        b11=inline(char(b1));
        b111=b11(a);
        h1=(b111-a111)/m;
        x=a;
        g1=eval(f);
        g2=inline(char(g1));
        sum=0;
        sum1=0;
        k1=m/3;
        for i=0:1:k1-1
            ev=a111+(3*i+1)*h1;
            ev1=a111+(3*i+2)*h1;
            sum=g2(ev)+g2(ev1)+sum;
        end
        for i=1:1:k1-1
            ev=a111+3*i*h;
            sum1=g2(ev)+sum1;
        end
        ga=(3/8)*(h1)*(g2(a111)+3*sum+2*sum1+g2(b111));
        %Calulando g(b)
        syms x
        a111=a11(b);
        b111=b11(b);
        h1=(b111-a111)/m;
        x=b;
        g1=eval(f);
        g2=inline(char(g1));
        sum=0;
        sum1=0;
        k1=m/3;
        for i=0:1:k1-1
            ev=a111+(3*i+1)*h1;
            ev1=a111+(3*i+2)*h1;
            sum=g2(ev)+g2(ev1)+sum;
        end
        for i=1:1:k1-1
            ev=a111+3*i*h;
            sum1=g2(ev)+sum1;
        end
        gb=(3/8)*(h1)*(g2(a111)+3*sum+2*sum1+g2(b111));
        syms x
        %Calculando la sumatoria interna
        sumatoria1=0;
        sumatoria2=0;
        sumatoria3=0;
        for i=0:1:k-1
           ev=a+(3*i+1)*h;
           a111=a11(ev);
           b111=b11(ev);
           x=ev;
           g1=eval(f);
           g2=inline(char(g1));
           hn=(b111-a111)/m;
           k1=m/2;
           sum=0;
           sum1=0;
           for j=0:1:k1-1
               ev1=a111+(3*j+1)*hn;
               ev2=a111+(3*j+2)*hn;
               sum=g2(ev1)+g2(ev2)+sum;
           end
           for j=1:1:k1-1
               ev2=a111+3*j*hn;
               sum1=g2(ev2)+sum1;
           end
           sumatoria1=(3/8)*(hn)*(g2(a111)+3*sum+2*sum1+g2(b111))+sumatoria1;
        end
        for i=0:1:k-1
           ev=a+(3*i+2)*h;
           a111=a11(ev);
           b111=b11(ev);
           x=ev;
           g1=eval(f);
           g2=inline(char(g1));
           hn=(b111-a111)/m;
           k1=m/2;
           sum=0;
           sum1=0;
           for j=0:1:k1-1
               ev1=a111+(3*j+1)*hn;
               ev2=a111+(3*j+2)*hn;
               sum=g2(ev1)+g2(ev2)+sum;
           end
           for j=1:1:k1-1
               ev2=a111+3*j*hn;
               sum1=g2(ev2)+sum1;
           end
           sumatoria2=(3/8)*(hn)*(g2(a111)+3*sum+2*sum1+g2(b111))+sumatoria2;
        end
        for i=1:1:k-1
           ev=a+3*i*h;
           a111=a11(ev);
           b111=b11(ev);
           x=ev;
           g1=eval(f);
           g2=inline(char(g1));
           hn=(b111-a111)/m;
           k1=m/2;
           sum=0;
           sum1=0;
           for j=0:1:k1-1
               ev1=a111+(3*j+1)*hn;
               ev2=a111+(3*j+2)*hn;
               sum=g2(ev1)+g2(ev2)+sum;
           end
           for j=1:1:k1-1
               ev2=a111+3*j*hn;
               sum1=g2(ev2)+sum1;
           end
           sumatoria3=(3/8)*(hn)*(g2(a111)+3*sum+2*sum1+g2(b111))+sumatoria3;
        end 
        resultado=(h/3)*(ga+3*sumatoria1+3*sumatoria2+2*sumatoria3+gb);
        display('El resultado de la integral es: ')
        format long
        resultado
    end
end