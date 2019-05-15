syms x;
for i=1:4
    p(i)=input('ingrese las x: ');
    y(i)=input('ingrese las y: ');
end
x0=p(1)
x1=p(2)
x2=p(3)
x3=p(4)
aprox=(((x-x1)*(x-x2)*(x-x3)*y(1))/((x0-x1)*(x0-x2)*(x0-x3)))+(((x-x0)*(x-x2)*(x-x3)*y(2))/((x1-x0)*(x1-x2)*(x1-x3)))+(((x-x0)*(x-x1)*(x-x3)*y(3))/((x2-x0)*(x2-x1)*(x2-x3)))+(((x-x0)*(x-x1)*(x-x2)*y(4))/((x3-x0)*(x3-x1)*(x3-x2)));
fprintf('la aproximación con grado 3: ')
aprox