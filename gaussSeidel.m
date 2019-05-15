%% Metodo de gauss seidel para la temperatura en un placa
A=[[4,-1,0,-1,0,0,0,0,0],
[-1,4,-1,0,-1,0,0,0,0],
[0,-1,4,0,0,-1,0,0,0],
[-1,0,0,4,-1,0,-1,0,0],
[0,-1,0,-1,4,-1,0,-1,0],
[0,0,-1,0,-1,4,0,0,-1],
[0,0,0,-1,0,0,4,-1,0],
[0,0,0,0,-1,0,-1,4,-1],
[0,0,0,0,0,-1,0,-1,4]];

b=[30,
0,
40,
30,
0,
40,
50,
20,
60]'

x=[0 0 0 0 0 0 0 0 0]'
n=size(x,1);
normVal=Inf; 

tol=1e-5; itr=0;
%%
while normVal>tol
    xold=x;
    
    for i=1:n
        sigma=0;
        
        for j=1:n
            
            if j~=i
                sigma=sigma+A(i,j)*x(j);
            end
            
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
    normVal=abs(xold-x);
end
%%
fprintf('La solucion del sistema para la placa de temperatura es : \n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n en %d iteraciones',x,itr);