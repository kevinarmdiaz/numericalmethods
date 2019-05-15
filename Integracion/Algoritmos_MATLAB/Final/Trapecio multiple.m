clc 
clear
syms x y
f=input('digite la funcion f=')
Ix=input('digite limites Ix')
Iy=input('digite limites Iy')
nx=('digite el numero de intervalos nx=')
ny=('digite el numero de intervalos ny=')
f=sym(f)
F=inline(char(f))
a=Ix(1,1);
b=Ix(1,2);
c=Iy(1,1);
d=Iy(1,2);
hx(b-a)/nx;
hy(d-c)/ny;
vectorx=a;
vectory=c;
for i=1:nx
    vectorx=vectorx+(a+i*h);  
end
for i=1:ny
    vectory=vectory+(c+i*h);
end

