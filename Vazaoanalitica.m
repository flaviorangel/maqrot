%calcula a vazão analiticamente
Valores;
Ro=FuncaoRaioExterno(raioCrista,raioVale,Z,1);
Ri=FuncaoRaioInterno(raioCrista,raioVale,Z,1);
k=Ri/Ro;
Qan=((pi*(Pent-Ps)*Ro^4)/(8*visc*Lb))*((1-k^4)-((1-k^2)^2)/log(1/k));