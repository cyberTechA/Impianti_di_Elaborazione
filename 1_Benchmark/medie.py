def average_from_file(file_path, output_file):
    # Apre il file di input in modalità lettura
    with open(file_path, 'r') as file:
        numbers = []  # Lista per memorizzare i numeri letti dal file
        averages = []  # Lista per memorizzare le medie calcolate

        # Itera su ogni riga del file
        for line in file:
            if line.strip() != "":
                numbers.append(int(line))  # Aggiunge il numero alla lista

            # Se la lista contiene 30 numeri, calcola la media e la aggiunge alla lista delle medie
            if len(numbers) == 30:
                averages.append(sum(numbers) / len(numbers))
                numbers = []  # Resetta la lista per il prossimo gruppo di numeri

    # Apre il file di output in modalità scrittura
    with open(output_file, "w") as output:
        # Scrive ogni media su una nuova riga nel file di output
        for average in averages:
            output.write(str(average) + "\n")


# Chiama la funzione con i percorsi dei file di input e output
average_from_file("/Users/raro69/Desktop/Impianti Alberto e Giuseppe/Benchmark/nbody/risultati1000.txt",
                  "/Users/raro69/Desktop/Impianti Alberto e Giuseppe/Benchmark/nbody/medie1000.txt")
