clc;
clear all;
  

% Leggi i dati dal file Excel
    data = xlsread('DataSet_OS1.xlsx');

    % Estrai i dati x e y dalle colonne della matrice dei dati
    x = data(:, 1);
    y = data(:, 2);
    datain=[x y];
    [r,p] = corr(x,y,'type','Kendall');
    fprintf('Kendall correlation: %.4f \n',r);
    fprintf('Kendall P: %.15f \n',p);
    [taub tau h CIlower, CIupper]=ktaub(datain,0.95,0)
