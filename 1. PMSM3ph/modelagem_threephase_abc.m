% Verificação de Ctrb e Obsv para PMSM 3ph nas coord. ABC


% Defina as matrizes A e B (usando os valores do modelo PMSM)
R_s = 0.1; % Resistência do estator
L_aa = 0.2; % Indutância 
L_bb = 0.2; % Indutância 
L_cc = 0.2; % Indutância 

L_m = 0.25; % Indutância mútua
Psi_m = 0.15; % Fluxo magnético do ímã permanente
w = 377;
P = 8;
J = 0.001;

% Matrizes do modelo em espaço de estados
A = [-Rs/L_aa 0 0 0;
     0 -Rs/L_bb 0 0;
     0 0 -Rs/L_cc 0;
     (3*P*Psi_m)/(4*J) -(3*P*Psi_m)/(4*J)*0.5 -(3*P*Psi_m)/(4*J)*0.5 -0.001/J];

B = [1/L_aa 0 0;
     0 1/L_bb 0;
     0 0 1/L_cc;
     0 0 0];

C = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
D = zeros(4, 3);

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