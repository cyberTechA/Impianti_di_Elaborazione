clc; 
clear; 

%% Calcoli di affidabilità

t = 3600;%1h

% Parametri lamda
lambda_CPU = 1 / (10000 * 3600);
lambda_RT = 1 / (4500 * 3600);
lambda_BUS = 1 / (60000 * 3600);
lambda_INS = 1 / (2000 * 3600);
lambda_Doppler = 1 / (500 * 3600);
lambda_AHRS = 1 / (2000 * 3600);

% Calcola le affidabilità dei componenti
R_CPU = exp(-lambda_CPU * t);
R_RT = exp(-lambda_RT * t);
R_BUS = exp(-lambda_BUS * t);
R_INS = exp(-lambda_INS * t);
R_Doppler = exp(-lambda_Doppler * t);
R_AHRS = exp(-lambda_AHRS * t);

%% Calcolo dell'affidabilità del sistema

Rsys = (1 - (1 - R_CPU)^2) * (1 - (1 - R_RT)^2) * (1 - (1 - R_BUS)^2)^2 * (1 - (1 - R_INS) * (1 - R_Doppler * (1 - (1 - R_AHRS)^3)));

%% Calcolo dell'affidabilità parziale del sistema

Rsys_parz = (1 - (1 - R_RT)^2) * (1 - (1 - R_BUS)^2)^2 * (1 - (1 - R_INS) * (1 - R_Doppler * (1 - (1 - R_AHRS)^3)));

%% Calcolo del valore di Coverage

C = 1 / R_CPU - 1 / R_CPU / (1 - R_CPU) + 0.99999 / R_CPU / (1 - R_CPU) / Rsys_parz;

%%
% Salvataggio dei valori di Rsys1, Rsys2 e m su un file di testo
fileID = fopen('risultati_helicopter.txt', 'w');
fprintf(fileID, 'Rsys: %.10f\n', Rsys);
fprintf(fileID, 'Rsys_parz: %.10f\n',Rsys_parz);
fprintf(fileID, 'Coverage: %.10f\n', C);
fclose(fileID);

%% Plot

t_plot = linspace(0, 10^7, 100);


% Calcola le affidabilità dei componenti_plot
R_CPU_plot = exp(-lambda_CPU .* t_plot);
R_RT_plot = exp(-lambda_RT .* t_plot);
R_BUS_plot = exp(-lambda_BUS .* t_plot);
R_INS_plot = exp(-lambda_INS .* t_plot);
R_Doppler_plot = exp(-lambda_Doppler .* t_plot);
R_AHRS_plot = exp(-lambda_AHRS .* t_plot);

Rsys_plot = (1 - (1 - R_CPU_plot).^2) .* (1 - (1 - R_RT_plot).^2) .* (1 - (1 - R_BUS_plot).^2).^2 .* (1 - (1 - R_INS_plot) .* (1 - R_Doppler_plot .* (1 - (1 - R_AHRS_plot).^3)));

figure
plot(t_plot, Rsys_plot)
xlabel('Secondi');
ylabel('Reliability');
legend('Rsys(t)');
ylim([0, 1.1]);
grid on
saveas(gcf, 'Rsys_helicopter_system.png')