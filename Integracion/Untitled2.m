clear all
clc
% %  Método de disparo líneal 
disp('*************************************************************************************');
disp('*******************************Método de disparo líneal*******************************');
disp('*************************************************************************************');
sym x;
FuncionExacta=inline('141*x + 40-(25*x^2)/2')
a=0;
b=10;
h=0.01;
n=round((b-a)/h);
alfa=40;
Beta=200;
u1(1)=alfa;
u2(1)=0;
v1(1)=0;
v2(1)=1;
px=0;
qx=0;
rx=-25;
xi=a:h:b;
wEx=[];
for i=1:n-1
    k11=h*u2(i);
    k12=h*(px*u2(i)+qx*u1(i)+rx);
    k21=h*(u2(i)+(1/2)*k12);
    k22=h*(px*(u2(i)+(1/2)*k12)+qx*u1(i)+(1/2)*k11+rx);
    k31=h*(u2(i)+(1/2)*k22);
    k32=h*(px*(u2(i)+(1/2)*k22)+qx*(u1(i)+(1/2)*k21)+rx);
    k41=h*(u2(i)+k32);
    k42=h*(px*(u2(i)+k32)+qx*(u1(i)+(1/2)*k31)+rx);
    u1(i+1)=u1(i)+(1/6)*(k11+2*(k21+k31)+k41);
    u2(i+1)=u2(i)+(1/6)*(k12+2*(k22+k32)+k42);
    
    kp11=h*v2(i);
    kp12=h*(px*v2(i)+qx*v1(i));
    
    kp21=h*(v2(i)+(1/2)*kp12);
    kp22=h*(px*(v2(i)+(1/2)*kp12)+qx*v1(i)+(1/2)*kp11);
    
    
    kp31=h*(v2(i)+(1/2)*kp22);
    kp32=h*(px*(v2(i)+(1/2)*kp22)+qx*(v1(i)+(1/2)*kp21));
    
    
    kp41=h*(v2(i)+kp32);
    kp42=h*(px*(v2(i)+kp32)+qx*(v1(i)+(1/2)*kp31));
    
    v1(i+1)=v1(i)+(1/6)*(kp11+2*(kp21+kp31)+kp41);
    v2(i+1)=v2(i)+(1/6)*(kp12+2*(kp22+kp32)+kp42);
 
 
    
end
 
 
w1(1)=alfa;
w2(1)=(Beta-u1(end))/(v1(end));
 
fprintf('x      |    T        |     Z   | Real');
for i=1:n; 
    
w1(i)=u1(i)+w2(1)*v1(i);
w2(i)=u2(i)+w2(1)*v2(i);
wEx(i)=FuncionExacta(xi(i));
fprintf('\n%0.2f | %10.4f | %10.6f | %10.6f',xi(i),w1(i),w2(i),wEx(i));
end
xi(end)=[];
 
plot(xi,w1,'r:',xi,wEx,'b--');
title('Método de disparo vs Función real')
legend('Método de disparo','Función real T=\it73.4523*e^{-0.1*x}-53.4523*e^{0.1*x}+20')
grid on

