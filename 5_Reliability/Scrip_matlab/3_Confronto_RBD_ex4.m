clc; 
clear;
close all; % Chiude tutte le figure

t = linspace(0, 10^7, 1000);

% Parametri a,b,c
lambda_a = 1 / (900 * 3600);
lambda_b = 1 / (7000 * 3600);
lambda_c = 1 / (1000 * 3600);

% Calcola le affidabilità a,b,c
Ra = exp(-lambda_a * t);
Rb = exp(-lambda_b * t);
Rc = exp(-lambda_c * t);

%% Sistema 1: Configurazione in serie
Rsys11 = 1 - (1 - Ra.*Rb) .* (1 - Ra.*Rc);
Rsys21 = Ra .* (1 - (1 - Rb) .* (1 - Rc));

% Plot del Sistema 1
figure
plot(t, Rsys11)
hold on
plot(t, Rsys21)
xlabel('Secondi');
ylabel('Reliability');
legend('Primo Sistema', 'Secondo Sistema');
grid on

saveas(gcf, 'configurazione_serie_sistema1.png')

%% Sistema 2: Configurazione in parallelo
Rsys12 = Ra .* (1 - (1 - Ra) .* (1 - Rb));
Rsys22 = Ra;

% Plot del Sistema 2
figure
plot(t, Rsys12)
hold on
plot(t, Rsys22)
xlabel('Secondi');
ylabel('Reliability');
legend('Primo Sistema', 'Secondo Sistema');
grid on

saveas(gcf, 'configurazione_parallelo_sistema2.png')

%% Sistema 3: Configurazione in parallelo-serie
Rsys13 = Ra .* Rb .* (1 - (1 - Ra) .* (1 - Rb));
Rsys23 = Ra .* Rb;

% Plot del Sistema 3
figure
plot(t, Rsys13)
hold on
plot(t, Rsys23)
xlabel('Secondi');
ylabel('Reliability');
legend('Primo Sistema', 'Secondo Sistema');
grid on

saveas(gcf, 'configurazione_parallelo_serie_sistema3.png')

%% Sistema 4: Configurazione in serie-parallelo
Rsys14 = (1 - (1 - Ra) .* (1 - Ra.*Rb));
Rsys24 = Ra;

% Plot del Sistema 4
figure
plot(t, Rsys14)
hold on
plot(t, Rsys24)
xlabel('Secondi');
ylabel('Reliability');
legend('Primo Sistema', 'Secondo Sistema');
grid on

saveas(gcf, 'configurazione_serie_parallelo_sistema4.png')