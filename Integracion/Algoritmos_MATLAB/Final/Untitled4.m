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
l=tril(A)
u=triu(A,1);

wx=1.25;
X=diag(A)
T=wx*l
inv(T);
T2=(1-wx)*diag(A)+wx*u;