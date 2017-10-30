function [raioInterno,Xri,Yri] = FuncaoRaioInterno(raioCrista,raioVale,z,tetano)
%FUNCAORAIOINTERNO calcula o raio do rotor dada o raio da crista e do vale,
%o comprimento de onda L e a posi??o z no momento da medi??o
Valores;
% 
% %liso
raioInterno=0.034;

% %crescente
%raioInterno = 0.034 + ((raioCrista - raioVale)/Lb)*z; 

%senoide
%raioInterno = (raioVale + raioCrista)/2 + ((raioCrista-raioVale)/2)*sin((2*pi/lOnda)*z + pi/2);

% %ondaquadrada
% z=round(z*100)+1;
% N =200;
% v=(raioCrista-raioVale);
% ndepassos=NZ;
% passo=Lb/ndepassos;
% x = [0:passo:Lb];
% f = 0.034+v/2+zeros(1,ndepassos+1);
% for i = 1:2:N
% a =2*v/pi/i;
% f = f-a*sin(13*pi*i*x);
% end
% f(1)=f(2);
% f(ndepassos+1)=f(ndepassos);
% plot(x,f)
% axis([0,1,0,inf])
% raioInterno=f(z);
Xri=raioInterno*cos(tetano);
Yri=raioInterno*sin(tetano);





end

