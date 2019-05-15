% metodo de Gauss-Seidel
fprintf('Metodo de Gauss Seidel\n');
A=input('Ingrese la matriz A: ');
x=input('Ingrese el vector x0: ');
b=input('ingresa el vector b: ');
tol=input('ingrese la tolerancia: ');
b=b';
x=x';
s=size(A);
n=s(1,1);
l=tril(A,1)
u=triu(A,1);

wx=1.25;
X=diag(A)
T=wx*l
for i=1:n;
    D(i,i)=A(i,i);
end
L=-(l-D);
U=-(u-D);
T=inv(D-L)*U;
c=inv(D-L)*b;
N=1
x1=T*x+c
while max(x1-x)>tol
    x=x1;
    N=N+1
    x1=T*x+c
end