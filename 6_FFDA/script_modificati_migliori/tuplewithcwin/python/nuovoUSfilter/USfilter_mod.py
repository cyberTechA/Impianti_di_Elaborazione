#!/usr/bin/python3

import os
import sys
import shutil
import re

# Leggo i path dei file di log e i campi su cui effettuare il filtraggio
logfiles = sys.argv[1:-1]
filtri = sys.argv[2:]

# Scandisco tutti i file di log
for logfile in logfiles:
    # Leggo il file di log, ho una lista di stringhe in loglines
    logfiled = open(logfile, "r")
    loglines = logfiled.readlines()
    logfiled.close()

    # Scandisco tutti i filtri specificati
    for filtro in filtri:
        # Determino se ho a che fare con un filtraggio su nodo o su categoria
        decisione = 0
        if re.search("^tg.*", filtro) or re.search("^R.*", filtro):
            decisione = 1

        # Apro un file in scrittura per collezionare i risultati
        nameFile = filtro + ".txt"
        f = open(nameFile, 'w')

        # Scandisco tutte le entry del log
        for line in loglines:
            # line è una lista che contiene varie stringhe ottenute splittando l'entry corrente rispetto al carattere " " (spazio)
            line = line.split()

            # Sto effettuando un filtraggio sulla categoria
            if decisione == 0:
                # Se la categoria della log entry corrente è uguale a quella di interesse
                if line[2] == filtro:
                    # Scrivi la log entry corrente nel file di output
                    f.write(' '.join(line) + '\n')
            # Filtraggio su nodo
            else:
                # Se il nodo della log entry corrente è uguale a quello di interesse
                if line[1] == filtro:
                    # Scrivi la log entry corrente nel file di output
                    f.write(' '.join(line) + '\n')

        # Chiudo il file
        f.close()
