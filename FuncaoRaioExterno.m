function [ raioExterno,Xre,Yre] = FuncaoRaioExterno(raioCrista, raioVale,z,tetano)
%FUNCAORAIOEXTERNO calcula o raio do estator dado 
% 
Ro=0.04;
Valores;
e=sqrt(Xe^2 + Ye^2);
%betha ? o angulo que a excentricidade se encontra
if Ye~=0 && Xe~=0
    betha = atan(Ye/Xe);
else
    betha=0;
end
%alpha ? o angulo entre a excentricidade e a 
alpha = tetano - betha;

raioExterno = e*cos(alpha) + sqrt(Ro^2 - (e^2*sin(alpha)));

%changing external radius instead of internal (dont forget to comment later)
raioExterno = (raioVale + raioCrista)/2 + ((raioCrista-raioVale)/2)*sin((2*pi/lOnda)*z + pi/2);
raioExterno = (raioExterno -0.039)*(-1) + 0.039 - 0.004;

Xre=raioExterno*cos(tetano);
Yre=raioExterno*sin(tetano);
end

