

import matplotlib.pyplot as plt
import numpy as np

def customized_barplot(start_value, max_value_graf, end_value, position):
    # Calcola la lunghezza del bar plot
    length = end_value - start_value
    
    # Prepara i dati per il grafico a barre
    x = np.array([position])  # Array degli indici
    y = np.array([length])  # Array dei valori
    
    # Crea il grafico a barre con offset in altezza
    plt.bar(x, y, color='blue', bottom=start_value)
    
    # Imposta l'asse Y da zero al massimo valore
    plt.ylim(130000, max_value_graf)
    
    # Imposta l'asse X per avere solo valori positivi
    plt.xlim(0, position + 1)
    
    # Mostra gli assi X e Y
    plt.axis('on')
    
   
    
#massimo valore asse y
max_value_graf = 175000


# Valori per la prima macchina
start_value_1 = 158205.4
end_value_1 = 158818.5
position_1 = 1

# Valori per la seconda macchina
start_value_2 = 163758.2
end_value_2 = 164189.2
position_2 = 2

# Crea il primo bar plot
customized_barplot(start_value_1, max_value_graf, end_value_1,position_1)

# Crea il secondo bar plot
customized_barplot(start_value_2, max_value_graf, end_value_2, position_2)

# Imposta la posizione dei tick sull'asse X
plt.xticks([position_1, position_2], ['Macchina A', 'Macchina B'])
plt.title('1000000')  # Titolo del grafico
# Mostra entrambi i bar plot
plt.show()






