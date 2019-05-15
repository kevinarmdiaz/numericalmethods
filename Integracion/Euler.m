clear all
clc
% % �M�todo de euler 
disp('*************************************************************************************');
disp('*******************************M�todo de euler.*******************************');
disp('*************************************************************************************');
syms  x y;
funcion=input('Ingrese la funci�n F(x,y)       :  ');
funcionReal=input('Ingrese la soluci�n real F(x,y)       :  ');
a=input('Ingrese el punto a, l�mite inferior :  ');
b=input('Ingrese el punto b, l�mite superior :  ');
h=input('Ingrese tama�o de paso (h)          :  ');
Condicion_Inicial=input('Ingrese Y0               :  ');
Y=[];YReal=[];
f=inline(funcion,char(x),char(y));
fReal=inline(funcionReal,char(x));
%% Calculamos los subintervalos.
N=(b-a)/(h)+1;
xi(1)=a;
Y(1)=Condicion_Inicial;
YReal(1)=fReal(xi);
Error=abs(Y(1)-YReal(1));
for i=1:N+1
    xi(i+1)=a+i*h;
    %% Calculamos soluci�n real.
    YReal(i+1)=fReal(xi(i+1));
end
for i=1:N+1
fprintf('n=%i     x%i=%.4f   %f   %.6f   %.6f \n',i-1,i-1,xi(i),Y(i),YReal(i),Error);
%% Soluci�n aproximada.
k1=f(xi(i),Y(i));
Y(i+1)=Y(i)+h*k1;
%% Calculamos el error.
Error=abs(Y(i+1)-YReal(i+1));
end






% for i=1:N+1
% Error=abs(Y(i+1)-YReal(i+1));
% funcionPrint=strcat(strrep(char(funcionReal),'x',num2str(xi(i+1))),'=',num2str(YReal(i+1)));
% ErrorPrint=strcat('Error Real=|',num2str(abs(Y(i+1))),'-',num2str(YReal(i+1)),'|','=',num2str(Error));
% 
% disp(funcionPrint);
% disp(ErrorPrint);
% end

for i=0:N-1
    fprintf('\n');
t0=strcat('t_',num2str(i),'=',num2str(xi(i+1)));
disp(t0);
end

for i=1:N+1
rep='y_i+(h)*((10500 (20 - t_i ))/(100 - 2.5*t_i ))';
funcionPrint=strrep(rep,'y_i',num2str(Y(i)));
funcionPrint=strrep(funcionPrint,'t_i',num2str(xi(i)));
funcionPrint=strrep(funcionPrint,'h',num2str(h));

funcionPrint=strcat(funcionPrint,'=',num2str(Y(i+1)));
funcionPrint=strcat('y_',num2str(i),'=',funcionPrint);
disp(funcionPrint);

end



%% Graficamos
plot(xi,Y);
title('M�todo de euler');
grid on;
legend('Curva Aproximada');
