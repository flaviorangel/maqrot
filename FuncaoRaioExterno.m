function [ raioExterno,Xre,Yre] = FuncaoRaioExterno(raioCrista, raioVale,z,tetano)
%FUNCAORAIOEXTERNO calcula o raio do estator dado 
% 
Ro=0.04;
Valores;
e=sqrt(Xe^2 + Ye^2);
%betha é o angulo que a excentricidade se encontra
if Ye~=0 && Xe~=0
    betha = atan(Ye/Xe);
else
    betha=0;
end
%alpha é o angulo entre a excentricidade e a 
alpha = tetano - betha;

raioExterno = e*cos(alpha) + sqrt(Ro^2 - (e^2*sin(alpha)));
Xre=raioExterno*cos(tetano);
Yre=raioExterno*sin(tetano);
end

