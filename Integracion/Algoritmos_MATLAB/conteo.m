clear all
clc
n=input('ingrese el orden:')
x=input('ingrese el valor de x: ')
a=input('ingrese el valor de a: ')
r=x-a
acmu=6;
acsum=n+1;
acr=0

for i=2:n;
    mu=2*(i-1)+1;
    acmu=acmu+mu;
end
for j=0:n;
    acr=acr+((r^j)/factorial(j));
end
if n==0
    acmu=3
end
fprintf('El número de multiplicaciones es:')
acmu
fprintf('el número de sumas y restas es:')
acsum
fprintf('el resultado de la sumatoria es:')
acr
