clc
clear
fx=input('digite la funcion en t,y');
F=inline(char(fx));
I=input('digite el intervalo de t');
w(1)=input('digite el valor inicial y(a)');
h=input('digite el tamaño de paso');
N=(I(1,2)-I(1,1))/h;
t=I(1,1):h:I(1,2);
for i=2:N+1
     w(i)=w(i-1)+h*F(t(i-1),w(i-1));
end
[t' w']
plot(t,w),grid on
