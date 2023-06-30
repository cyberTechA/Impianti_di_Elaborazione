function SensitivityTupleAllLogs(logFolder, cwin)

% Sensitivity Analysis of tuple count

% Ottieni la lista dei file di log nella cartella specificata
logFiles = dir(fullfile(logFolder, 'log_*.txt'));

% Ciclo per elaborare i file di log
for i = 1:numel(logFiles)
    % Estrai il nome del file di log
    logFileName = fullfile(logFolder, logFiles(i).name);
    
    % Esegui l'analisi di sensitività per il file di log corrente
    DataPoint = SensitivityTuple(logFileName, cwin);
    
    % Salva il plot corrente con il nome del file di log
    [~, plotName, ~] = fileparts(logFiles(i).name);
    splitName = split(plotName, '_');
    plotTitle = ['Sensitivity Analysis - ', char(splitName(2))];
    
    figure;
    plot(DataPoint(1,:),DataPoint(2,:),'-*b');
    xlabel('Window Size');
    ylabel('# of tuples');
    title(plotTitle);
    
    % Salva il plot corrente
    saveas(gcf, fullfile(logFolder, ['plot-SensAnaly ', char(splitName(2)), '.png']));
    
    % Chiudi la finestra del plot
    close(gcf);
end

end

%% lancio dello script
%logFolder = 'log2'; dichiara il path della cartella che contiene i file
%filtrati con denomilazione log_ davanti al nome(se non ce aggiungila seno
%lo script non funziona)
%cwin = 'tentative-Cwin.txt'; inserisci il pathe delle cwin desiderate io
%ho usato quelle fornite dal materiale del corso 
%SensitivityTupleAllLogs(logFolder, cwin); lancia lo script anche se sembra
%che non va dagli tempo i file sono grandi da analizzare 



