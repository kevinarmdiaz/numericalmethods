clear all
clc
% % •Método de euler 
disp('*************************************************************************************');
disp('*******************************Método de runge kutta orden4.*******************************');
disp('*************************************************************************************');
funcion=input('Ingrese la función F(x,y)       :  ');
funcionReal=input('Ingrese la solución real F(x,y)       :  ');
a=input('Ingrese el punto a, límite inferior :  ');
b=input('Ingrese el punto b, límite superior :  ');
h=input('Ingrese tamaño de paso (h)          :  ');
Condicion_Inicial=input('Ingrese Y0               :  ');
Y=[];YReal=[];
f=inline(funcion,char('x'),char('y'));
fReal=inline(funcionReal,char('x'));
%% Calculamos los subintervalos.
N=(b-a)/(h)+1;
xi(1)=a;
Y(1)=Condicion_Inicial;
YReal(1)=fReal(xi);
Error=abs(Y(1)-YReal(1));
for i=1:N
%fprintf('iteracion n=%i     x%i=%f  Aproximación=%f     Real=%.6f   Error=%f \n',i-1,i-1,xi(i),Y(i),YReal(i),Error);
%% Solución aproximada.
k1=f(xi(i),Y(i));
repk1='f(t_i ,y_i )';
funcionPrint=strrep(repk1,'y_i',num2str(Y(i)));
funcionPrint=strrep(funcionPrint,'t_i',num2str(xi(i)));
funcionPrint=strrep(funcionPrint,'h',num2str(h));
funcionPrint=strcat(funcionPrint,'=',num2str(k1));
funcionPrint=strcat('k_1 = ',funcionPrint);
disp(funcionPrint);
fprintf('\n');
k2=f(xi(i)+h/2 ,Y(i)+(h/2)*k1);
repk2='f(t_i+(h/2),y_i+(h/2)*k_1)';
funcionPrint=strrep(repk2,'y_i',num2str(Y(i)));
funcionPrint=strrep(funcionPrint,'t_i',num2str(xi(i)));
funcionPrint=strrep(funcionPrint,'h',num2str(h));
funcionPrint=strcat(funcionPrint,'=',num2str(k2));
funcionPrint=strrep(funcionPrint,'k_1',num2str(k1));
funcionPrint=strcat('k_2 = ',funcionPrint);
disp(funcionPrint);
fprintf('\n');
k3=f(xi(i)+h/2 ,Y(i)+(h/2)*k2);
repk3='f(t_i+(h/2),y_i+(h/2)*k_2 )';
funcionPrint=strrep(repk3,'y_i',num2str(Y(i)));
funcionPrint=strrep(funcionPrint,'t_i',num2str(xi(i)));
funcionPrint=strrep(funcionPrint,'h',num2str(h));
funcionPrint=strcat(funcionPrint,'=',num2str(k3));
funcionPrint=strrep(funcionPrint,'k_2',num2str(k2));
funcionPrint=strcat('k_3 = ',funcionPrint);
disp(funcionPrint);
fprintf('\n');
k4=f(xi(i)+h ,Y(i)+ h*k3);
repk4='f(t_i+h,y_i+h*k_3 )';
funcionPrint=strrep(repk4,'y_i',num2str(Y(i)));
funcionPrint=strrep(funcionPrint,'t_i',num2str(xi(i)));
funcionPrint=strrep(funcionPrint,'h',num2str(h));
funcionPrint=strcat(funcionPrint,'=',num2str(k4));
funcionPrint=strrep(funcionPrint,'k_3',num2str(k3));
funcionPrint=strcat('k_4 = ',funcionPrint);
disp(funcionPrint);
fprintf('\n');
Y(i+1)=Y(i)+(h/6)*(k1+2*k2+2*k3+k4);
repy='y_i+(h/6)*(k_1+2*k_2+2*k_3+k_4)';
funcionPrint=strrep(repy,'y_i',num2str(Y(i)));
funcionPrint=strrep(funcionPrint,'h',num2str(h));
funcionPrint=strrep(funcionPrint,'k_1',num2str(k1));
funcionPrint=strrep(funcionPrint,'k_2',num2str(k2));
funcionPrint=strrep(funcionPrint,'k_3',num2str(k3));
funcionPrint=strrep(funcionPrint,'k_4',num2str(k4));
funcionPrint=strrep(funcionPrint,'--','+');
funcionPrint=strrep(funcionPrint,'+-','-');
funcionPrint=strrep(funcionPrint,'-+','-');
funcionPrint=strcat(funcionPrint,'=',num2str(Y(i+1)));
funcionPrint=strcat('y_',num2str(i),'=',funcionPrint);
disp(funcionPrint);
fprintf('\n');
%% Calculamos el error.
Error=abs(Y(i+1)-YReal(i+1));
end







%% Graficamos
plot(xi,Y);
title('Método de rk4');
grid on;
legend('Curva aproximacion');