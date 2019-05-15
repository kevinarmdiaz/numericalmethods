function Xk=Gauss_seidel(A1,Xo,E)
[A,B,Tam]=extract(A1);
domin(A);
for i=1:Tam
    for j=1:Tam
        D(i,j)=0;
        L(i,j)=0;
        U(i,j)=0;
        if (i==j)
            D(i,j)=A(i,j);
        elseif(i>j)
            L(i,j)=-A(i,j);
        elseif(i<j)
            U(i,j)=-A(i,j);
        end
    end
end
format long;
Xk=Xo';
Tg=(inv(D-L))*U;
Cg=(inv(D-L))*B';
Uk=(Tg*Xo')+Cg;
Xk=[Xk,Uk];
e=InfNorm(Xk);
Verror(1)=1;
Verror(2)=e;
l=2;
while (l<=25) && (e>=E)
    Tg=(inv(D-L))*U;
    Cg=(inv(D-L))*B';
    Uk=(Tg*Xk(:,l))+Cg;
    Xk=[Xk,Uk];
    e=InfNorm(Xk);
    Verror(l+1)=e;
    l=l+1;
end

t=size(Xk);

for i=1:t(2)
    Xk((t(1)+1),i)=Verror(i);
end