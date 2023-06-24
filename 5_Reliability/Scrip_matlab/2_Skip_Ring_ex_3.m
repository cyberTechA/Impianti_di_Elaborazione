
clc, clear

%% dati
t = 48;
lambda = 0.005;
Rm = exp(-lambda*t);
%% Nessun nodo della rete fallisce i=0
Ri0 = Rm^8;
%% un solo nodo della rete fallisce i=1
Ri1 = 8*Rm^7*(1-Rm);
%% Due nodi della rete falliscono i=2
Ri2 = 20*Rm^6*(1-Rm)^2;
%% Tre nodi della rete falliscono i=3
Ri3 = 16*Rm^5*(1-Rm)^3;

%% Quattro nodi della rete falliscono i=4
Ri4 = 2*Rm^4*(1-Rm)^4

%% Probabilità che il sistema funzioni correttamente
Rsys = Ri0 +Ri1 +Ri2 +Ri3 + Ri4;

%% Plot
t_plot = linspace(0, 300, 1000);
Rsys_plot = zeros(size(t_plot));

for i = 1:length(t_plot)
    t = t_plot(i);
    Rm = exp(-lambda*t);
    Ri0 = Rm^8;
    Ri1 = 8*Rm^7*(1-Rm);
    Ri2 = 20*Rm^6*(1-Rm)^2;
    Ri3 = 16*Rm^5*(1-Rm)^3;
    Ri4 = 2*Rm^4*(1-Rm)^4;
    Rsys_plot(i) = Ri0 + Ri1 + Ri2 + Ri3 + Ri4;
end

plot(t_plot, Rsys_plot,'b')
hold on
t_point = 48;
Rsys_point = exp(-lambda*t_point)^8 + 8*exp(-lambda*t_point)^7*(1-exp(-lambda*t_point)) + 20*exp(-lambda*t_point)^6*(1-exp(-lambda*t_point))^2 + 16*exp(-lambda*t_point)^5*(1-exp(-lambda*t_point))^3 + 2*exp(-lambda*t_point)^4*(1-exp(-lambda*t_point))^4;
plot(t_point, Rsys_point, 'ro', 'MarkerFaceColor', 'red')
xlabel('Time')
ylabel('Reliability')
legend('Rsys(t)', 'Rsys(48)')
grid on

% Salvataggio del grafico
saveas(gcf, 'plot_skip_ring.png');


% Salvataggio dei valori Ri da 0 a 4 e Rsys(48) su un file di testo
fileID = fopen('risultati_skip_ring.txt', 'w');
fprintf(fileID, 'Ri0: %f\n', Ri0);
fprintf(fileID, 'Ri1: %f\n', Ri1);
fprintf(fileID, 'Ri2: %f\n', Ri2);
fprintf(fileID, 'Ri3: %f\n', Ri3);
fprintf(fileID, 'Ri4: %f\n', Ri4);
fprintf(fileID, 'Rsys(48): %f\n', Rsys);
fclose(fileID);
