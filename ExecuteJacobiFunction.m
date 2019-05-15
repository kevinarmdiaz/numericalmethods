A = [[4,-1,0,-1,0,0,0,0,0],
[-1,4,-1,0,-1,0,0,0,0],
[0,-1,4,0,0,-1,0,0,0],
[-1,0,0,4,-1,0,-1,0,0],
[0,-1,0,-1,4,-1,0,-1,0],
[0,0,-1,0,-1,4,0,0,-1],
[0,0,0,-1,0,0,4,-1,0],
[0,0,0,0,-1,0,-1,4,-1],
[0,0,0,0,0,-1,0,-1,4]];

b = [0,0,0,0,0,0,0,0,0];

maxiter = 100;

epsilon = 1e-3;

% y es vector soluci�n
% err es el error final
% it es el numero de iteraciones final
% A matriz del sistema
% b vector del sistema
% maxiter es numero m�ximo de iteraciones
% epsilon es la cota del error
n=length(b);
it=0;
err=2*epsilon;
x=zeros(1,n);
y=zeros(1,n);
while it<maxiter & err>epsilon
    for i=1:n
        S=0;
       for j=1:n;
       if i~=j;
        S=S+A(i,j)*x(j);
       end
       end
       y(i)=(b(i)-S)/A(i,i);
    end
    it=it+1;
    err=norm(x-y,1);
    x=y;
end
y
it
err