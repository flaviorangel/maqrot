%chama todas as rotinas
tic; %start timer
close all; %force deletes all figures
Valores; %import from .m file
%calculando os coeficientes
    [C0W,C1,C2,Z,RE,RI] = CalculaCoeficientes(); %imports function from .m file as long as the call matches the FILE name
    %Montando a matriz de diferen?as Finitas e o vetor 
    [M,f]=Montamatriz(C1,C2,C0W);
    %Resolvendo o sistema M*p=f
    [P]=Solve(M,f); %solves the system of equations 
    toc; %ends timer
    
    %visualization code
    figure;
    subplot(1,2,1)
    Plota;
    axis([0 inf -inf inf])
    xlabel('z/L')
    ylabel('Pressure(Pa)')
    grid on
    set(gcf,'position',[565,180,800,500])
    subplot(1,2,2)
    plot(Z,RI,Z,RE)
    title('Geometria da bomba')
    legend('Raio Interno','Raio Externo')
    axis([-inf inf 0.03 0.05])
    %calculando numenricamente a vaz?o
    [Pmat,Q,Ur,ur,Xraio,Yraio,TETAS]=Vazaocalculada(P,C2,RE,RI);
    t=0:100;
    %calculando analiticamente a vaz?o
    disp('vazao calculada =')
    disp(Q)
    
    %avalia se o estator ou rotor s?o lisos para poder calcular a vaz?o
    %analitica
    [a,b]=size(RI);
    c=0;
    for i=1:a
        if RI(i)==RI(i+1)
            c=c+1;
        end
    end
    %if c==a
    %    Vazaoanalitica;
    %    disp('you idiot')
    %    disp('vaz?o analitica =')
    %    disp(Qan)
    %    erro=abs((Q-Qan)*(100/Qan));
    %    disp('erro(%):')
    %    disp(erro)
    %end
    figure;
    surf(Xraio,Yraio,ur);
    axis([-0.045 0.045 -0.045 0.045])
    view(0,90)
    c=colorbar('eastoutside');
    title(c,['\fontsize{14}U'])
    set(gcf,'position',[565,125,700,550])

