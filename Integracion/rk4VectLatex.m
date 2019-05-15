%% Use Rk4 vectorial
clc; clear all;close all; %Cerramos ventanas y limpiamos variables.
syms  y z x 
format long
dydx=inline('-2*y+4*exp(-x)',char(x),char(y),char(z)); 
dzdx=inline('(-y*z^2)/3',char(x),char(y),char(z));
%fReal=inline('73.4523*exp(0.1*x) - 53.4523*exp(-0.1*x) + 20');
% punto a, límite inferior :  
% punto b, límite superior : 
%% Condiciones iniciales.
a=0;b=1;

h=0.2; n=(b-a)/h;
w1=zeros(1,n);
w2=zeros(1,n);
w1(1)=2;
w2(1)=4;
x=a:h:b;
%Creación de vectores.
ErrorAbs=[];E1=[];Error1abs=[];E2=[];Error2abs=[];
Error1abs(1)=0;
Error2abs(1)=0;
%wReal(1)=fReal(0);
for i=2:n+1
    k1(1,1)=h*dydx(x(i-1),w1(i-1),w2(i-1));
    k1(2,1)=h*dzdx(x(i-1),w1(i-1),w2(i-1));
    
    repk1='h*(?(-2*y_i+4e^((-x_i))@(-y_i*z_i^2)/3))';
    
    
    funcionPrint=strrep(repk1,'y_i',num2str(w1(i-1)));
    funcionPrint=strrep(funcionPrint,'x_i',num2str(x(i)));
    funcionPrint=strrep(funcionPrint,'z_i',num2str(w2(i-1)));
    funcionPrint=strrep(funcionPrint,'h',num2str(h));
    funcionPrint=strcat(funcionPrint,'=','(?(',num2str(k1(1,1)),'@',num2str(k1(2,1)),'))');
    funcionPrint=strcat('k_1 = ',funcionPrint);
    disp(funcionPrint);
    
    k2(1,1)=h*dydx(x(i-1)+h/2,w1(i-1)+k1(1,1)/2,w2(i-1)+k1(2,1)/2);
    k2(2,1)=h*dzdx(x(i-1)+h/2,w1(i-1)+k1(1,1)/2,w2(i-1)+k1(2,1)/2);
    
    repk2='h*((?(-2*y_i+4e^(-(x_i+h/2))@(-y_i*z_i^2)/3))+((k_1))/2)';
    
    funcionPrint=strrep(repk2,'y_i',num2str(w1(i-1)));
    funcionPrint=strrep(funcionPrint,'x_i',num2str(x(i)));
    funcionPrint=strrep(funcionPrint,'z_i',num2str(w2(i-1)));
    funcionPrint=strrep(funcionPrint,'h',num2str(h));
    k1String = strcat('(?(',num2str(k1(1,1)),'@',num2str(k1(2,1)),'))'); 
    funcionPrint=strrep(funcionPrint,'k_1',k1String);
    funcionPrint=strcat(funcionPrint,'=','(?(',num2str(k2(1,1)),'@',num2str(k2(2,1)),'))');
    funcionPrint=strcat('k_2 = ',funcionPrint);
    disp(funcionPrint);
    
    
    k3(1,1)=h*dydx(x(i-1)+h/2,w1(i-1)+k2(1,1)/2,w2(i-1)+k2(2,1)/2);
    k3(2,1)=h*dzdx(x(i-1)+h/2,w1(i-1)+k2(1,1)/2,w2(i-1)+k2(2,1)/2);
    repk3=' h*((?(-2*y_i+4e^(-(x_i+h/2))@(-y_i*z_i^2)/3))+((k_2))/2)';
    funcionPrint=strrep(repk3,'y_i',num2str(w1(i-1)));
    funcionPrint=strrep(funcionPrint,'x_i',num2str(x(i)));
    funcionPrint=strrep(funcionPrint,'z_i',num2str(w2(i-1)));
    funcionPrint=strrep(funcionPrint,'h',num2str(h));
    k2String = strcat('(?(',num2str(k2(1,1)),'@',num2str(k2(2,1)),'))'); 
    funcionPrint=strrep(funcionPrint,'k_2',k2String);
    funcionPrint=strcat(funcionPrint,'=','(?(',num2str(k3(1,1)),'@',num2str(k3(2,1)),'))');
    funcionPrint=strcat('k_3 = ',funcionPrint);
    disp(funcionPrint);
    
    k4(1,1)=h*dydx(x(i-1)+h,w1(i-1)+k3(1,1),w2(i-1)+k3(2,1));
    k4(2,1)=h*dzdx(x(i-1)+h,w1(i-1)+k3(1,1),w2(i-1)+k3(2,1));
    repk4='h*((?(-2*y_i+4e^(-(x_i+h))@(-y_i*z_i^2)/3))+k_3 )';
        
    funcionPrint=strrep(repk4,'y_i',num2str(w1(i-1)));
    funcionPrint=strrep(funcionPrint,'x_i',num2str(x(i)));
    funcionPrint=strrep(funcionPrint,'z_i',num2str(w2(i-1)));
    funcionPrint=strrep(funcionPrint,'h',num2str(h));
    k3String = strcat('(?(',num2str(k3(1,1)),'@',num2str(k3(2,1)),'))'); 
    funcionPrint=strrep(funcionPrint,'k_3',k3String);
    funcionPrint=strcat(funcionPrint,'=','(?(',num2str(k4(1,1)),'@',num2str(k4(2,1)),'))');
    funcionPrint=strcat('k_4 = ',funcionPrint);
    disp(funcionPrint);
    k4String = strcat('(?(',num2str(k4(1,1)),'@',num2str(k4(2,1)),'))'); 
    TciString = strcat('(?(',num2str(w1(i-1)),'@',num2str(w2(i-1)),'))');
    w1(i)=w1(i-1)+(1/6)*(k1(1,1)+2*k2(1,1)+2*k3(1,1)+k4(1,1));
    w2(i)=w2(i-1)+(1/6)*(k1(2,1)+2*k2(2,1)+2*k3(2,1)+k4(2,1));
    TciStr =  strcat('(?(',num2str(w1(i)),'@',num2str(w2(i)),'))');
    repy = 'Yz_i+(1/6)*(k_1+2*k_2+2*k_3+k_4 )'; 
    funcionPrint=strrep(repy,'Yz_i',TciString);
    funcionPrint=strrep(funcionPrint,'k_1',k1String);
    funcionPrint=strrep(funcionPrint,'k_2',k2String);
    funcionPrint=strrep(funcionPrint,'k_3',k3String);
    funcionPrint=strrep(funcionPrint,'k_4',k4String);
    funcionPrint=strcat(funcionPrint,'=',TciStr);
    funcionPrint=strcat('Yz_',num2str(i-1),'=',funcionPrint);
    disp(funcionPrint);
%    wReal(i)=fReal(a+i*h);
    %fprintf('n=%i T(%i)=%.4f T(%i)=%.4f f(%i)=%.4f \n',i,i,w2(i),i,wReal(i))
end

 
