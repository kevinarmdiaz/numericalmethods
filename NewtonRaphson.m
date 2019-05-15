x = 0.05;
x_old = 0;
x_true = 0;
iter = 0;
while abs(x_old-x) > 10^-3 && iter <= 100
    f='x_(i+1)=x_i-(sin(x_i)+cos(1+x_i^2)- 1)/( cos(x_i)-sin(1+x_i^2 )*2*x_i)';
    f=strrep(f,'x_i',num2str(x_old));
    x_old = x;
    x = x - (sin(x)+cos(1+x^2) - 1)/(cos(x)-sin(1+x^2)*2*x);
    iter = iter + 1;
    f=strrep(f,'(i+1)',num2str(iter));
    f=strcat(f,'=',num2str(x));
    %fprintf('Iteration %d: x=%.20f, err=%.20f\n', iter, x, abs(x-x_old));
    disp(f)
end

