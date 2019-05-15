

function[s]=simp13Funcion(f,I,n)
syms x;

if mod(n,2)==1
    n=n+1;
    disp('******El número es impar se le sumará uno a n********');
    fprintf('n=%f \n',n);
end
k=n/2;
h=(I(1,2)-I(1,1))/n; %h=(b-a)/n
a=I(1,1);
b=I(1,2);
x=a;
s=eval(f);%%evalua en x.
for i=1:k-1
    x=a+(2*i-1)*h;
    s=s+4*eval(f);
    x=a+(2*i)*h;
    s=s+2*eval(f);
end
x=a+(2*k-1)*h;
s=s+4*eval(f);
x=b;
s=(h/3)*(s+eval(f));
fprintf('El valor de la integral es= %f',s);

end

