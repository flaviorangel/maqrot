function[Pmat,Q,Ur,ur,Xraio,Yraio,TETAS]=vazaocalculada(P,C2,RE,RI)
Valores;
Pmat=[];
%criando matriz das pressões
for i=1:NZ
    for j=1:NTETA
        k=(j-1)*NZ+i;
        Pmat(i,j)=P(k);
    end
end
% Determinando os vetores Ur e Wr de velocidade integrados em r:
%=========Nos internos ===============
ic=99;
Xraio=[];
Yraio=[];
TETAS=[];
for j=1:NTETA
    raioInterno = RI(ic,j);
    raioExterno = RE(ic,j);
    NRAIO=10;
    DR=raioExterno-raioInterno;
    DRAIO=DR/NRAIO;
    tetano=(j-1)*DTETA;
    for k=0:NRAIO
        rno=raioInterno + k*DRAIO;
        ur(j,k+1) = ((raioInterno^2)/(4*visc))*((Pmat(ic+1,j)-Pmat(ic,j))/DZ)*((rno/raioInterno)^2 - 1 - (raioExterno^2 - ...
        raioInterno^2)*((log(rno/raioInterno))/((raioInterno)^2*log(raioExterno/raioInterno))));
        Xraio(j,k+1)=rno*cos(tetano);
        Yraio(j,k+1)=rno*sin(tetano);
        TETAS(j,k+1)=tetano;
    end
end

for i=1:(NZ-1)
    for j=1:(NTETA-1)
        Ur(i,j)=(C2(i,j)*(Pmat(i+1,j)-Pmat(i,j))/(DZ));
    end
end
%Fronteira esquerda e direita
j=NTETA;
for i=1:NZ-1 
    Ur(i,j)=Ur(i,1);
end
% Determinacao da vazao total :
Q=0;
i=NZ-1;
for j=1:NTETA-1
    Um=(Ur(i,j+1)+Ur(i,j))/2;
    Q=Q+Um*DTETA;
end