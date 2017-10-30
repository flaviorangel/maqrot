%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Entrada de dados relacionados ao escoamento:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MALHA DO DOM?NIO
% NZ, n?mero de intervalos ao longo do eixo z (dire??o do escoamento):
    %NZ=101;
    NZ =100;
% NTETA, n?mero de intervalos ao longo do eixo Teta:
    %NTETA=221; %OBSERVA??O: NTETA deve ser ?mpar!
    NTETA =41;
%numero de passos na dire??o R:
    NRAIO=10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% U : velocidade do rotor (m/s) (?? um valor positivo)
    u=0;%-100;
% Omega: rota????o do rotor em radianos por segundo
    omega=100*2*pi/60;
% Intervalo de tempo (segundos)
% Press?o na Entrada (Pa) :
    Pent=392266;
% Press?o na Sa?da (Pa) :
    Ps=100000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados geom?tricos da bomba
% Raio do rotor (em metros) :
    %raioVale=0.039878/2;
    raioVale = 0.034;
% Raio do estator (em metros) :
    %raioCrista=0.040248/2;
    raioCrista=0.039;
% Passo do rotor (m) (comprimento de onda):
    %lOnda=0.059995;
    lOnda=0.18;
% N??mero de passos do rotor
    numeroPassosRotor=16.667;
% Lb= Comprimento da bomba (m) :
    Lb=1;
%e = excentricidade (m)(distancia entre os centros da secao e da helice do rotor):
Xe = 0;
%Ye = 0.001; %must be around 0.001
Ye = 0;

% Velocidade tangencial (perif?rica) do rotor (somente para a geometria simplificada)
    %w = (omega)*raioInterno;
%CARACTERISTICAS DO FLUIDO
% Viscosidade (Pa.s) :

visc=0.001; % ?gua 
%visc=0.042; % Purolub 46
%visc=0.433; % Purolub 150
% Densidade do fluido(kg/m3) :
    Rho=1000;
% Rho=868; % Purolub 46
%Rho=885; % Purolub 150
% gravidade (m/s2)
    g=9.8;
% Subdivis?oo da malha do dom?nio:
    DZ=Lb/(NZ-1);
    DTETA=2*pi/(NTETA-1);
    NTOTAL=NZ*NTETA;