clc; clear all; close all

% Posicao de leitura do sensor
s = [20
     0];
 
% Posicao real do robo
p = [20
     0];
 
% Ruidos de medicao
eP = [0
      0];

% Tempo maximo
tmax = 2 * pi;

% Variação de tempo (passo)
dt = pi/150;

% Loop para plot do grafico
for t=0:dt:tmax
    % Nova posicao do robo
    dP = [20*cos(t)
          20*sin(t).*cos(t)];
    
    % Erro de leitura (ruido)
    eP = randn(2,1);
    
    %Concatenacao dos valores antigos com o novo valor de posicao
    p = [p , dP];
    
    % Concatenacao dos valores antigos com erro de medicao do robo com a 
    % nova medicao com erro de posicao
    s = [s , dP+eP];
    
    % Plot animado da posicao e da posicao medida
    plot(p(1,:), p(2,:), 'k', 'linewidth', 2);
    hold on
    plot(s(1,:), s(2,:), 'r', 'linewidth', 2);
    grid on, axis equal
    hold off
    xlabel("X")
    ylabel("Y")
    legend('p(t) - posição do robô','s(t) - leitura do sensor GPS')
    drawnow
end