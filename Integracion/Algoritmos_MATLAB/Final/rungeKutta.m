function y = rungeKutta(fun, limInf, limSup, x0, y0, n)
format long

%%rungeKutta(@(x,y)(((5*y)/(x+1))-y), 0,4, 0,1,4)

h = (limSup - limInf)/n;
yi = y0;
for j = 0:n - 1
    xi = x0 + (j*h);
    
    k1 = feval(fun, xi,yi);
    k2 = feval(fun, (xi+(h/2)),(yi + (k1*(h/2))));
    k3 = feval(fun, (xi+(h/2)),(yi + (k2*(h/2))));
    k4 = feval(fun, (xi+h),(yi + (k3*h)));
    
    yi = yi + (1/6)*(k1 + (2*k2)+(2*k3)+k4)*h    
    
    
    
end

end
