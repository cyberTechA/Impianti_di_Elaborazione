clc;
clear;

t = linspace(0, 10^7, 10000);
%% m
m = 5;
%% s
s = 3;
%% MTTF
MTTF = 1400;

%% lambda
lambda = 1 / (MTTF * 3600);
R = exp(-lambda * t);


%% 1 considerazione grafico mostra come varia l'affidafilita del sistema
%%complessiovo al variare dell'affidabilità del singolo componente R varia
%%tra 0 e 1
 r_1= linspace(0, 1, 100);
%% Plot 1 Considerazione
sist1 = 1 - (1 - r_1.^3).^m;
sist2 = (1 - (1 - r_1).^5).^s;

figure;
plot(r_1, sist1);
hold on;
plot(r_1, sist2);
xlabel('Reliability componente');
ylabel('Reliability Sistema');
legend('Primo Sistema', 'Secondo Sistema');
grid on
saveas(gcf, 'plot_Sistema_componente.png');



%% Plot al variare di m per il sistema 1

sist1_1 = 1 - (1 - r_1.^3).^10;
sist1_2 = 1 - (1 - r_1.^3).^15;
sist1_3 = 1 - (1 - r_1.^3).^20;
sist1_4 = 1 - (1 - r_1.^3).^25;
sist1_5 = 1 - (1 - r_1.^3).^30;
sist1_6 = 1 - (1 - r_1.^3).^35;
sist2 = (1 - (1 - r_1).^5).^s;
figure;
plot(r_1, sist1);
hold on;
plot(r_1, sist1_1);
hold on;
plot(r_1, sist1_2);
hold on;
plot(r_1, sist1_3);
hold on;
plot(r_1, sist1_4);
hold on;
plot(r_1, sist1_5);
hold on;
plot(r_1, sist1_6);
hold on;
plot(r_1, sist2,'--');
xlabel('Reliability componente');
ylabel('Reliability Sistema');
legend('Primo_m5','Primo_m10','Primo_m15','Primo_m20','Primo_m25','Primo_m30','Primo_m35', 'Secondo Sistema');
grid on
saveas(gcf, 'plot_Sistema_componenteal variare_di_m.png');
%% plot
Rsys1 = 1 - (1 - R.^3).^m;
Rsys2 = (1 - (1 - R).^5).^s;

figure;
plot(t, Rsys1);
hold on;
plot(t, Rsys2);
xlabel('Secondi');
ylabel('Reliability');
legend('Primo Sistema', 'Secondo Sistema');
grid on

% Salvataggio del grafico
saveas(gcf, 'plot_rel_sec.png');


%% plot test visivo sul MFFT
Rsys1 = 1 - (1 - R.^3).^m;
Rsys1_1 = 1 - (1 - R.^3).^10;
Rsys1_2 = 1 - (1 - R.^3).^15;
Rsys1_3 = 1 - (1 - R.^3).^20;
Rsys1_4 = 1 - (1 - R.^3).^25;
Rsys1_5 = 1 - (1 - R.^3).^30;
Rsys1_6 = 1 - (1 - R.^3).^35;
Rsys2 = (1 - (1 - R).^5).^s;
figure;
plot(t, Rsys1);
hold on;
plot(t, Rsys1_1);
hold on;
plot(t, Rsys1_2);
hold on;
plot(t, Rsys1_3);
hold on;
plot(t, Rsys1_4);
hold on;
plot(t, Rsys1_5);
hold on;
plot(t, Rsys1_6);
hold on;
plot(t, Rsys2,'--');
xlabel('Secondi');
ylabel('Reliability');
legend('Primo_m5','Primo_m10','Primo_m15','Primo_m20','Primo_m25','Primo_m30','Primo_m35', 'Secondo Sistema');
grid on

% Salvataggio del grafico
saveas(gcf, 'plot_cos_vis_MTTF.png');


%% mission_time
miss_time = (1400 * 3600);
%% R_mod 
R_mod = exp(-lambda * miss_time);

%% calcolo Rsys1 e Rsys2
R1 = 1 - (1 - R_mod.^3).^m;
R2 = (1 - (1 - R_mod).^5).^s;

%% calcolo m
m_calcolato = log(1 - R2) / log(1 - R_mod.^3);

% Salvataggio dei valori di Rsys1, Rsys2 e m su un file di testo
fileID = fopen('risultati.txt', 'w');
fprintf(fileID, 'Rsys1: %f\n', R1);
fprintf(fileID, 'Rsys2: %f\n',R2);
fprintf(fileID, 'm_calcolato: %f\n', m_calcolato);
fclose(fileID);