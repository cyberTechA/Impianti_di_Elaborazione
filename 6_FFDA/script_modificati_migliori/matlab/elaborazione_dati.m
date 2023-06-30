% Cartella contenente i file di ingresso
folderPath = 'Re_UnRe_per_nodo_e_per_categoria_Mercury';

% Ottenere la lista dei file nella cartella specificata
fileList = dir(fullfile(folderPath, 'interarrivals_*.txt'));

% Ciclo per elaborare i file di ingresso
for i = 1:numel(fileList)
    % Carica i dati dal file di ingresso
    fileName = fullfile(folderPath, fileList(i).name);
    data = load(fileName);

    % Esegue i comandi specificati
    [y, t] = cdfcalc(data);
    empTTF = y(2:end);
    empRel = 1 - empTTF;

    % Estrai il nome del file per il titolo del plot
    [~, plotName, ~] = fileparts(fileName);
    splitName = split(plotName, '_');
    plotTitle = char(splitName(2));

    % Crea il plot con il titolo corretto
    figure;
    plot(t, empTTF, '-*b', t, empRel, '-+r');
    xlabel('time [s]');
    ylabel('p');
    legend('emp TTF', 'emp Rel');
    title(plotTitle);
    
    % Salva il plot con la dicitura corretta
    saveas(gcf, fullfile(folderPath, ['plot-', plotName, '.png']));
    
    % Chiudi la finestra del plot
    close(gcf);
end
