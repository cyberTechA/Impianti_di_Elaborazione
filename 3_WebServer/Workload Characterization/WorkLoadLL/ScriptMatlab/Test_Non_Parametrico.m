clc; clear;

real = xlsread('LL_caratterizzato_PC');
synthetic = xlsread('LL_2_caratterizzato_PC');

N = size(real,2);


[norm_wl_real, p_value_norm_real] = kstest(real);
[norm_wl_synth, p_value_norm_synth] = kstest(synthetic);


%%Test Non Parametrico - Wilcoxon Test
p_wilc = zeros(1,N);
h_wilc = zeros(1,N);
for i = 1:N
    [p_wilc(i), h_wilc(i)] = ranksum(synthetic(:,i), real(:,i));
end


%% Save data to a text file
fileID = fopen('Data_validation.txt', 'w');
fprintf(fileID, 'norm_wl_real: %f\n', norm_wl_real);
fprintf(fileID, 'p_value_norm_real: %f\n', p_value_norm_real);
fprintf(fileID, 'norm_wl_synth: %f\n', norm_wl_synth);
fprintf(fileID, 'p_value_norm_synth: %f\n', p_value_norm_synth);
fprintf(fileID, 'p_wilc: %f\n', p_wilc);
fprintf(fileID, 'h_wilc: %f\n', h_wilc);
fclose(fileID);