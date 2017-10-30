Valores;
N =2000;
v=(raioCrista-raioVale);
ndepassos=100;
passo=Lb/ndepassos;
x = [0:passo:Lb];
f = 0.034+v/2+zeros(1,ndepassos+1);
for i = 1:2:N
a =2*v/pi/i;
f = f+ a*sin(11*pi*i*x);
end
f(1)=f(2);
f(ndepassos+1)=f(ndepassos);
f=0.4-f;
plot(x,f)