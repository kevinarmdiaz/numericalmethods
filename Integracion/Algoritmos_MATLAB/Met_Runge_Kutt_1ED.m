clc
clear
fx=input('digite la funcion en t,y (en comillas)  ');
F=inline(char(fx));
I=input('digite el intervalo de t (en corchetes)  ');
w(1)=input('digite el valor inicial y(a)  ');
h=input('digite el tamaño del paso (h)  ');
N=(I(1,2)-I(1,1))/h;
t=I(1,1):h:I(1,2);
for i=2:N+1
    k1=h*F(t(i-1),w(i-1))
    k2=h*F(t(i-1)+h/2,w(i-1)+k1/2)
    k3=h*F(t(i-1)+h/2,w(i-1)+k2/2)
    k4=h*F(t(i),w(i-1)+k3)
    w(i)=w(i-1)+(1/6)*(k1+2*k2+2*k3+k4)
end
[t',w']