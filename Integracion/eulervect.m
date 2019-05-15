  %% método de euler!
            a=0;
            b=15;
            h=1;
            syms  u y x

    XPrima=inline('y','x','y');
    YPrima=inline('-5*x*y-(x+7)*sin(t)','t','x','y');
    n=(b-a)/h;
    x = a:h:b;
            Y=[];
            Y=zeros(1,n);
            X=zeros(1,n);
            X=[];
            k1=[];
            k2=[];
            Y(1)=1.5; X(1)=6;
            for i=1:n+1
                k1(1,1)=XPrima(X(i),Y(i));
                k1(2,1)=YPrima(x(i),X(i),Y(i));
                Y(i+1)=Y(i)+h*(k1(1,1));
                X(i+1)=X(i)+h*(k1(2,1));
                rep=' (?(y_i@x_i ))+h*(?(y_i@-5*x_i*y_i-(x_i+7)*sin(t_i)))';
                funcionPrint=strrep(rep,'y_i',num2str(Y(i)));
                funcionPrint=strrep(funcionPrint,'x_i',num2str(X(i)));
                funcionPrint=strrep(funcionPrint,'t_i',num2str(x(i)));
                funcionPrint=strrep(funcionPrint,'h',num2str(h));
                funcionPrint=strrep(funcionPrint,'--','+');
                funcionPrint=strrep(funcionPrint,'+-','-');
                funcionPrint=strrep(funcionPrint,'-+','-');
                
                funcionPrint=strcat(funcionPrint,'=','(?(',num2str(Y(i+1)),'@',num2str(X(i+1)),'))');
                funcionPrint=strcat('YX_',num2str(i),'=',funcionPrint);
                disp(funcionPrint);

            end
              
               