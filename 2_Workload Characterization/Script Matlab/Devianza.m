clc;
clear;

 

%% Read the data
data = xlsread('dati'); % Leggi i dati dal file "dati"
pca_data = xlsread('pca'); % Leggi i dati PCA dal file "pca"
cluster_data = xlsread('cluster'); % Leggi i dati di clustering dal file "cluster"
N_pca = size(pca_data,2); % Numero di componenti principali (numero di colonne dei dati PCA)
N_cluster = max(cluster_data); % Numero di cluster (massimo valore nei dati di clustering)

 

%% Total Deviance
data_norm = zscore(data); % Normalizza i dati
DEV_TOT = sum(sum((data_norm-mean(data_norm,1)).^2)); % Devianza totale

 

%% PCA Deviance
DEV_PCA = sum(sum((pca_data-mean(pca_data,1)).^2)); % Devianza dopo PCA
DEV_PCA_per = DEV_PCA/DEV_TOT; % Percentuale di devianza dopo PCA

 

%% Cluster Deviance
W = zeros(N_cluster,1); % Devianza intra-cluster (within)
B = zeros(N_cluster,1); % Devianza inter-cluster (between)
for i = 1:N_cluster
    index = find(cluster_data==i); % Trova gli indici dei campioni appartenenti al cluster i
    n_ele = size(index,1); % Numero di campioni nel cluster i
    centroid = mean(pca_data(index,:),1); % Calcola il centroide del cluster i
    W(i) = sum(sum((centroid-pca_data(index,:)).^2)); % Calcola la devianza intra-cluster
    B(i) = n_ele*sum((centroid-mean(pca_data,1)).^2); % Calcola la devianza inter-cluster
end

 

W = sum(W); % Devianza totale intra-cluster
B = sum(B); % Devianza totale inter-cluster
(W+B)/DEV_PCA; % Verifica se W+B è uguale alla devianza dopo PCA

 

DEV_PCA_CL_per = (B/DEV_TOT); % Percentuale di devianza dopo PCA e clustering
DEV_LOST_per = (1-DEV_PCA/DEV_TOT)+(W/DEV_TOT); % Percentuale di devianza persa dopo PCA e clustering
%DEV_LOST_per2 = (1-DEV_PCA/DEV_TOT)+ DEV_PCA_per * W/DEV_PCA; % Formula equivalente

%% Salva dati su txt rinominare il file per il PC desiderato e cluster scelti
fileID = fopen('script_results.txt', 'w');
fprintf(fileID, 'DEV_TOT: %f\n', DEV_TOT);
fprintf(fileID, 'DEV_PCA: %f\n', DEV_PCA);
fprintf(fileID, 'DEV_PCA_per: %f\n', DEV_PCA_per);
fprintf(fileID, 'W: %f\n', W);
fprintf(fileID, 'B: %f\n', B);
fprintf(fileID, 'DEV_PCA_CL_per: %f\n', DEV_PCA_CL_per);
fprintf(fileID, 'DEV_LOST_per: %f\n', DEV_LOST_per);
fclose(fileID);
