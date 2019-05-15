% metodo de gauss Seidel Matricial
fprintf('Metodo de Gauss Seidel\n');
A=[[4,-1,0,-1,0,0,0,0,0],
[-1,4,-1,0,-1,0,0,0,0],
[0,-1,4,0,0,-1,0,0,0],
[-1,0,0,4,-1,0,-1,0,0],
[0,-1,0,-1,4,-1,0,-1,0],
[0,0,-1,0,-1,4,0,0,-1],
[0,0,0,-1,0,0,4,-1,0],
[0,0,0,0,-1,0,-1,4,-1],
[0,0,0,0,0,-1,0,-1,4]];

x=[0,0,0,0,0,0,0,0,0];

b=[50,20,60,30,0,40,30,0,40];

tol=1e-6;

b=b';
x=x';
s=size(A);
n=s(1,1);
l=tril(A)
u=triu(A);
for i=1:n;
    D(i,i)=A(i,i);
end
Dinv=inv(D);
L=-(l-D);
U=-(u-D);
T=inv(D-L)*U
c=inv(D-L)*b;
N=1
x1=T*x+c;
while max(x1-x)>tol;
    x=x1;
    N=N+1
    x1=T*x+c
end
radio = max(abs(eig(T)))
