def average_from_file(file_path, output_file):
    # Apre il file di input in modalità lettura
    with open(file_path, 'r') as file:
        numbers = []  # Lista per memorizzare i numeri letti dal file
        averages = []  # Lista per memorizzare le medie calcolate

        # Itera su ogni riga del file
        for line in file:
            if line.strip() != "":
                numbers.append(int(line))  # Aggiunge il numero alla lista

            # Se la lista contiene 5 numeri, calcola la media e la aggiunge alla lista delle medie
            if len(numbers) == 30:
                averages.append(sum(numbers) / len(numbers))
                numbers = []  # Resetta la lista per il prossimo gruppo di numeri

    # Apre il file di output in modalità lettura/scrittura
    with open(output_file, "a+") as output:
        # Legge i valori esistenti nel file di output
        existing_values = output.readlines()
        existing_values = [float(value.strip()) for value in existing_values]

        # Aggiunge le nuove medie alla lista dei valori esistenti
        existing_values.extend(averages)

        # Si posiziona all'inizio del file per sovrascrivere i valori
        output.seek(0)

        # Scrive i valori aggiornati nel file di output
        for value in existing_values:
            output.write(str(value) + "\n")

        # Tronca il file alla lunghezza corretta nel caso in cui le nuove medie siano meno delle precedenti
        output.truncate()


# Chiama la funzione con i percorsi dei file di input e output
average_from_file("/Users/raro69/Desktop/Impianti Alberto e Giuseppe/1_Benchmark/M1Pro_A/risultati_r_1_1000000.txt",
                  "/Users/raro69/Desktop/Impianti Alberto e Giuseppe/1_Benchmark/M1Pro_A/medie_r_1_1000000.txt")
