function [M,f]=montamatriz2(C1,C2,C0W)
%monta a matriz
Valores;
%alocando memoria
M=zeros(NTOTAL,NTOTAL);
cont=1;
%condições de contorno Z=0 e Z=L
while cont<=NTOTAL
    M(cont,cont)=1;
    cont=cont+NZ-1;
    M(cont,cont)=1;
    cont=cont+1;
end

%condições de contorno p(TETA=0)=P(TETA=pi)
cont=0;
while cont<NZ-2
    M(NTOTAL-NZ+2+cont,2+cont)=1;
    M(NTOTAL-NZ+2+cont,NTOTAL-NZ+2+cont)=-1;
    cont=cont+1;
end

%nós da fronteira de baixo
cont=2;
j=1;
for i=2:NZ-1
    a=(1/DTETA^2)*(C1(i,NTETA-1));
    M(cont,NTOTAL-2*NZ+cont)=a;
    b=(1/DZ^2)*(C2(i-1,j));
    M(cont,cont-1)=b;
    c=-((1/DTETA^2)*((C1(i,j))+C1(i,NTETA-1))...
        +(1/DZ^2)*(C2(i,j)+C2(i-1,j)));
    M(cont,cont)=c;
    d=(1/DZ^2)*(C2(i,j));
    M(cont,cont+1)=d;
    e=(1/DTETA^2)*(C1(i,j));
    M(cont,cont+NZ)=e;
    cont=cont+1;
end


cont=NZ+2;
%nós internos
for j=2:NTETA-1
    for i=2:NZ-1
        a=(1/DTETA^2)*(C1(i,j-1));
        M(cont,cont-NZ)=a;
        b=(1/DZ^2)*(C2(i-1,j));
        M(cont,cont-1)=b;
        c=-((1/DTETA^2)*((C1(i,j))+C1(i,j-1))...
            +(1/DZ^2)*(C2(i,j)+C2(i-1,j)));
        M(cont,cont)=c;
        d=(1/DZ^2)*(C2(i,j));
        M(cont,cont+1)=d;
        e=(1/DTETA^2)*(C1(i,j));
        M(cont,cont+NZ)=e;
        cont=cont+1;
    end
    cont=cont+2;
end

%montando o vetor b
%condcontorno
f=zeros(NTOTAL,1);
cont=1;
while cont<=NTOTAL
    f(cont)=Pent;
    cont=cont+NZ-1;
    f(cont)=Ps;
    cont=cont+1;
end

cont=2;
for j=1:NTETA-1
    for i=2:NZ-1
        if j==1
            l=((C0W(i,j) - C0W(i,NTETA-1))/(DTETA));
            f(cont)=l;
        else
            l=((C0W(i,j)-C0W(i,j-1))/(DTETA)); 
            f(cont)=l;
        end
        cont=cont+1;
    end
    cont=cont+2;
end

%



