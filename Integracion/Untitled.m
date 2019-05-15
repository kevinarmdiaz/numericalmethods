            %% método de euler!
            a=0;
            b=10;
            h=0.01;
            syms  u y x

                uprima=inline('-25','u','y');
    Tprima=inline(char(u),'u','y');
    n=(b-a)/h;
    w = 200;
     d=zeros(1,3);
    d(1) = 50;
    d(2) = 100;
    Tvect= zeros(1,2);
    for j=1:2
    
            u=[];
            u=zeros(1,n);
            T=zeros(1,n);
            T=[];
            k1=[];
            k2=[];
            u(1)=d(j); T(1)=40;
            for i=2:n+1
                k1(1,1)=h*uprima(u(i-1),T(i-1));
                k1(2,1)=h*Tprima(u(i-1),T(i-1));
                u(i)=u(i-1)+h*(k1(1,1));
                T(i)=T(i-1)+h*(k1(2,1));
            end
            Tvect(j)=T(end);
            T(end)
            u(end)
            
    end
            
         d(3) =(w - Tvect(2))/( Tvect(1) - Tvect(2))* d(1) +( w - Tvect(1))/(Tvect(2) - Tvect(1))* d(2);
                     u=[];
            u=zeros(1,n);
            T=zeros(1,n);
            T=[];
            k1=[];
            k2=[];
            u(1)=d(j); T(1)=40;
                     u(1)=d(3); T(1)=40;
            for i=2:n+1
                k1(1,1)=h*uprima(u(i-1),T(i-1));
                k1(2,1)=h*Tprima(u(i-1),T(i-1));
                u(i)=u(i-1)+h*(k1(1,1));
                T(i)=T(i-1)+h*(k1(2,1));
            end
            Tvect(j)=T(end);
         