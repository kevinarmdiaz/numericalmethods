%% Temperatura de una placa calentada con condiciones de frontera fijas
clear all
clc
%% Algoritmo.
Es=0.01;
lambda=1.2;
m=5; n=5; % matriz de 3*3;
%% Creamos la matriz inicial de ceros
T=zeros(m,n);
%% Creamos las condiciones de frontera;
T(1,:)=60;
T(:,1)=0;
T(m,:)=50;
T(:,n)=120;
Ea=100;
iteraciones=0;
%% Dos bucles para calculo.
while(Ea>Es)
    for j=2:n-1 
        for i=2:m-1
            TAnterior=T(i,j);
            T(i,j)=(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))/4;
            
            
            step1='T_(i,j)=(T_(i+1,j)+ T_(i-1,j)+ T_(i,j+1)+T_(i,j-1))/4';
            step1=strrep(step1,'i',num2str(i-1));
            step1=strrep(step1,'j',num2str(j-1));
            disp(step1);
            fprintf('\n');
            step1med='(T_(i+1,j)+ T_(i-1,j)+ T_(i,j+1)+T_(i,j-1))/4';
            step1med=strrep(step1med,'T_(i+1,j)',num2str(T(i+1,j)));
            step1med=strrep(step1med,'T_(i-1,j)',num2str(T(i-1,j)));
            step1med=strrep(step1med,'T_(i,j+1)',num2str(T(i,j+1)));
            step1med=strrep(step1med,'T_(i,j-1)',num2str(T(i,j-1)));
            step1med=strcat(step1med,'=',num2str(T(i,j)));
            disp(step1med);
            fprintf('\n');
            %% Sobrerelajación
            T(i,j)=lambda*T(i,j)+(1-lambda)*TAnterior;
            step2='T_(i,j)^nuevo = ?*T_(i,j)^nuevo+(1+?)*T_(i,j)^anter#or';
            step2=strrep(step2,'i',num2str(i-1));
            step2=strrep(step2,'j',num2str(j-1));
            step2=strrep(step2,'?',num2str(lambda));
            step2=strcat(step2,'=',num2str(T(i,j)));
            disp(step2);
            fprintf('\n');
            Ea=abs((T(i,j)-TAnterior)/(T(i,j)));
            step3='|e_a |=|T_(i,j)^nuevo- T_(i,j)^anter#or |/|T_(i,j)^nuevo |<e_s';
            step3=strrep(step3,'i',num2str(i-1));
            step3=strrep(step3,'j',num2str(j-1));
            step3=strrep(step3,'e_s',num2str(Es));
            step4='|e_a|=|(T_(i,j)^nuevo - T_(i,j)^anterior )|/|(T_(i,j)^nuevo )|<e_s';
            step4=strrep(step4,'T_(i,j)^nuevo',num2str(T(i,j)));
            step4=strrep(step4,'T_(i,j)^anterior',num2str(TAnterior));
            step4=strrep(step4,'e_s',num2str(Es));
            step4=strcat(step4,'=',num2str(Ea),'<',num2str(Es));
            disp(step4);
            if(Ea<Es)
               break;
            end
            
        end
    end
    iteraciones=iteraciones+1;
end
Temp=T(2:m-1,2:n-1);
Temp=transpose(Temp);
%% Impresión de resultados.
fprintf('Temperatura de la placa para un Es=%f en %i iteraciones \n',Es,iteraciones);
for i=length(Temp):-1:1
    for j=1:1:length(Temp)
        fprintf('%.4f \t',Temp(i,j));
    end
        fprintf('\n');
end
