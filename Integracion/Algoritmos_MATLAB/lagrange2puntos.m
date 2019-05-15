x=input('ingrese el valor que quiere aproximar: ')
for i=1:2
    p(i)=input('ingrese las x: ');
    y(i)=input('ingrese las y: ');
end
aprox=((x-p(2))*y(1)/(p(1)-p(2)))+((x-p(1))*y(2)/(p(2)-p(1)));
fprintf('la aproximación con grado 1: ')
aprox