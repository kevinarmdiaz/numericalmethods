clc
clear
syms x %variable simbolica
f = input('Digite la función f='); %para ingresar la funcion
n = input('Digite el número de intervalos n=');
while mod(n,2)==1
   input('Digite un nuevo valor de n que sea par =');
end
I = input('Digite el intervalo de integración [a,b] I='); %Entregar el intervalo [a,b]
a = I(1,1);  b = I(1,2);
h = (b-a)/n;
k = n/2;
x =a;
s = eval(f);
   for i=1:k-1
    x=a+(2*i-1)*h;    s=s+4*eval(f);
    x=a+(2*i)*h;      s=s+2*eval(f);
   end
x=b-h;  s=s+4*eval(f);    %Tambien se puede hacer asi= a+(2*(k-1)*h)

x=b;    s=s+eval(f);
s=(h/3)*s;
fprintf('El valor de la integral es = %f con n=%i\n',s,n)