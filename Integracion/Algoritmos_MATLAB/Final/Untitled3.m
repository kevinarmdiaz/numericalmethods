k = 0;

cond = 1;

while ( cond &&( k<itermax) )

y = -(triu(A,1))*x0+b; % se realiza la operación y = U*x0 +b;

x = tril (A) \ y; % se resuelve un sistema triangular inferior (D-L) x=y.

if ( norm(x-x0)<tol)

cond = 0;

else

k = k+1;

x0 = x;

end % Fin del if

end % fin del while

if k<iter

disp (' Solución (x1,…xn)',x) 

else

disp('Número máximo de iteraciones excedido');

end

