

clc
clear all
close all

%%

% Defina as matrizes A e B (usando os valores do modelo PMSM)
R_s = 0.1; % Resistência do estator
L_d = 0.2; % Indutância de eixo direto
L_q = 0.3; % Indutância de eixo quadratura
L_m = 0.25; % Indutância mútua
% Verificação de Ctrb e Obsv para PMSM 3ph no modelo DQ Linearizado


Psi_m = 0.15; % Fluxo magnético do ímã permanente
P = 8;
N = P/2;
J = 0.001;
Bm=0

%Ponto de operação
OMEGA = 2*pi*240;
Iq_med = 10;
Id_med = 0;

%%



A = [-R_s/L_d, -N*OMEGA*L_q/L_d, N*Iq_med*L_q/L_d;
     -N*OMEGA*L_d/L_q, -R_s/L_q, -(N/L_q)*(L_d*Id_med+Psi_m);
     0, (3*P*Psi_m)/(4*J), -Bm/J];

B = [1/L_d, 0;
     0, 1/L_q;
     0, 0];

C = [1 0 0; 0 1 0; 0 0 1]; % Matriz de saída para medir a velocidade angular

%% Verificação de controlabilidade e observabilidade
% Calcule a matriz de controlabilidade
Co = ctrb(A, B);

% Determine o número de estados não controláveis
unco = length(A) - rank(Co);

% Verifique se o sistema é controlável
if unco == 0
    disp('O sistema é controlável.');
else
    disp('O sistema não é controlável.');
end

% Calcule a matriz de observabilidade
Ob = obsv(A, C);

% Determine o número de estados não observáveis
unob = length(A) - rank(Ob);

% Verifique se o sistema é observável
if unob == 0
    disp('O sistema é observável.');
else
    disp('O sistema não é observável.');
end

unco
unob

% %% Calculo dos ganhos da matriz L (Obsv)
% 
%  Q_est = diag([1 1 1]);
% 
%  R_est= diag([1 1 1]);
% estimador = lqr(A', C', Q_est, 1* R_est);
% 
% % Salvar o valor dos ganhos em .txt e figuras em .pdf
% % Devido a modelagem adotada o ganho é negativo
% dlmwrite('L.txt',estimador,'precision','%.15f') % envio para arquivo txt
% 
% %save2pdf('Fig_step')