x=input('ingrese el valor que quiere aproximar: ')
for i=1:3
    p(i)=input('ingrese las x: ');
    y(i)=input('ingrese las y: ');
end
x1=p(1)
x2=p(2)
x3=p(3)
aprox=(((x-x2)*(x-x3)*y(1))/((x1-x2)*(x1-x3)))+(((x-x1)*(x-x3)*y(2))/((x2-x1)*(x2-x3)))+(((x-x1)*(x-x2)*y(3))/((x3-x1)*(x3-x2)));
fprintf('la aproximación con grado 2: ')
aprox