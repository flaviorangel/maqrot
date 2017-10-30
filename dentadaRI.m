Valores;
N =200;
v=(raioCrista-raioVale);
ndepassos=100;
passo=Lb/ndepassos;
x = [0:passo:Lb];
f = 0.034+v/2+zeros(1,ndepassos+1);
for i = 1:2:N
a =2*v/pi/i;
f = f-a*sin(13*pi*i*x);
end
f(1)=f(2);
f(ndepassos+1)=f(ndepassos);
plot(x,f)
axis([0,1,0,inf])