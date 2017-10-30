%================================================================================
% Calcula as constantes que formam a equacao de Poisson da
% press??o discreta (diferencas centrais nas segundas derivadas)
%
%================================================================================
function [C0W,C1,C2,Z,RE,RI] = CalculaCoeficientes()
Valores;
%alocando memoria --- sugestao do matlab
C1 = zeros(NZ,NTETA);
C0W = zeros(NZ,NTETA);
C2= zeros(NZ,NTETA);
% nos internos
RE=[];
RI=[];
for ic=1:NZ
    zno=(ic-1)*DZ;
    Z(ic)=zno;
    for j=1:NTETA
        tetano=(j-1)*DTETA;
        [raioExterno,Xre,Yre] = FuncaoRaioExterno(raioCrista, raioVale,zno,tetano);
        [raioInterno,Xri,Yri] = FuncaoRaioInterno(raioCrista, raioVale,zno,tetano);
        if ic == 1
            plot(Xre,Yre,'.',Xri,Yri,'.',0,0,'*')
            hold on
        end
        
        w=(omega)*raioInterno;

        k = ((raioInterno^2)*(log(raioInterno)-0.5)) - ((raioExterno)^2)*(log(raioExterno)-0.5)/(raioExterno^2 - raioInterno^2);
         
        C1(ic,j) =   (raioInterno/(2*visc))*((1/(2*raioInterno))*((raioExterno^2)*log(raioExterno) - ...
                     (raioInterno^2)*log(raioInterno)-(raioExterno^2 - raioInterno^2)*(1-k)) ...
                     - raioInterno*(log(raioInterno) - 0.5 + k )*log(raioExterno/raioInterno));

        C2(ic,j)= -(raioInterno^2/(8*visc))*((raioExterno^2-raioInterno^2)- ...
                    ((raioExterno^4-raioInterno^4)/(2*raioInterno^2)) + ...
                    ((raioExterno^2-raioInterno^2)/((raioInterno^2)*log(raioExterno/raioInterno)))*((raioExterno^2)*log(raioExterno/raioInterno) - ...
                    0.5*(raioExterno^2-raioInterno^2) ) );

        C0W(ic,j)= -w*raioInterno*((log(raioExterno/raioInterno)*(1+(raioInterno^2)/(raioExterno^2-raioInterno^2)))-0.5);
        RE(ic,j) = raioExterno;
        RI(ic,j) = raioInterno;
    end
end
hold off


    
