% metodo de jacobi
fprintf('Metodo de Jacobi\n');
A=input('Ingrese la matriz A: ');
x=input('Ingrese el vector x0: ');
b=input('ingresa el vector b: ');
tol=input('ingrese la tolerancia: ');
b=b';
x=x';
s=size(A);
n=s(1,1);
l=tril(A);
u=triu(A);
for i=1:n;
    D(i,i)=A(i,i);
end
Dinv=inv(D);
L=-(l-D);
U=-(u-D);
T=Dinv*(L+U)
c=Dinv*b
N=1
x1=T*x+c
while max(x1-x)>tol;
    x=x1;
    N=N+1
    x1=T*x+c
end

