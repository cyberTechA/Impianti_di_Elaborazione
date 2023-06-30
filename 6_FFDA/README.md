## Contenuto di ffdatoolset:

Il ffdatoolset è un software di analisi utilizzato per l'elaborazione e l'analisi di log di errori. Di seguito è riportato il contenuto della cartella:

### File eseguibili:
1. `tupleCount_func_CWIN.sh` (o `tupleCount_func_CWINpy.sh`) - Conta le tuple presenti nel log.
   - NOTA: Non utilizzare direttamente `tuplesWithCWIN.py` (viene richiamato da `tupleCount_func_CWINpy.sh`).
2. `tupling_with_Cwin.sh` - Effettua il tupling utilizzando una finestra di coalescenza (CWIN) selezionata.
3. `logStatistics.sh` - Calcola le statistiche sulle entry presenti nel log.
4. `filter.sh` - Filtra il log in base al nodo o alla categoria di errore (o alla card nel caso di BGL).

### File di log:
1. `MercuryErrorLog.txt` - Log degli errori per il progetto Mercury (HOMEWORK).
2. `BGLErrorLog.txt` - Log degli errori per il progetto BGL (HOMEWORK).
3. `MercuryErrorLogTEST.txt` - Contiene le prime 10000 righe di `MercuryErrorLog.txt` ed è stato utilizzato per ottenere i risultati di esempio mostrati in aula.

### File di esempio:
- `sample_MercuryErrorLog.txt` - Contiene alcuni valori del tuple count per `MercuryErrorLog.txt`, utili per la verifica della correttezza del conteggio per il log dell'homework.
- `sample_BGLErrorLog.txt` - Contiene alcuni valori del tuple count per `BGLErrorLog.txt`, utili per la verifica della correttezza del conteggio per il log dell'homework.

### File di configurazione:
- `tentative-Cwin.txt` - Contiene alcuni valori di finestre di coalescenza in secondi da utilizzare come input per `tupleCount_func_CWIN*`. È possibile aggiungere ulteriori valori per i quali determinare il tuple count.

### File di dizionario:
- `dictionary.txt` - Esempio di dizionario da un datacenter reale, utilizzato come riferimento per l'analisi dei log.

Si prega di consultare i file appropriati per ulteriori informazioni sulle funzionalità e sull'utilizzo del ffdatoolset.