import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter

# Funzione di formattazione per convertire i valori in percentuale
def percent_formatter(x, pos):
    return f'{x:.0f}%'

plt.ylim(75, 100)
plt.xlim(0, 24)

#  Cluster da 10
Cluster_number_x_10 = [10, 10, 10]  # Punto 10 dell'asse x ripetuto 3 volte
DEV_PCA_CL_per_y_10 = [78.8376, 82.1428, 83.7405]  # Valori y per il punto 10

#  Cluster da 15
Cluster_number_x_15 = [15, 15, 15]  # Punto 15 dell'asse x ripetuto 3 volte
DEV_PCA_CL_per_y_15 = [79.6822, 84.5142, 86.2281]  # Valori y per il punto 15

#  Cluster da 20
Cluster_number_x_20 = [20, 20, 20]  # Punto 20 dell'asse x ripetuto 3 volte
DEV_PCA_CL_per_y_20 = [80.2143, 84.9405, 87.9750]  # Valori y per il punto 20


# Plot dei punti speciali con colori diversi per il Cluster da 10
colors_10 = ['C1', 'C2', 'C3']
plt.stem(Cluster_number_x_10[0], DEV_PCA_CL_per_y_10[0], linefmt=colors_10[0]+ '-', markerfmt=colors_10[0]+ 'o', basefmt=' ' )
plt.stem(Cluster_number_x_10[1], DEV_PCA_CL_per_y_10[1], linefmt=colors_10[1]+ '-', markerfmt=colors_10[1]+ 'o', basefmt=' ', bottom=DEV_PCA_CL_per_y_10[0])
plt.stem(Cluster_number_x_10[2], DEV_PCA_CL_per_y_15[2], linefmt=colors_10[2]+ '-', markerfmt=colors_10[2]+ 'o', basefmt=' ',bottom=DEV_PCA_CL_per_y_10[1])





# Plot dei punti speciali con colori diversi per il Cluster da 15
colors_15 = ['C1', 'C2', 'C3']
plt.stem(Cluster_number_x_15[0], DEV_PCA_CL_per_y_15[0], linefmt=colors_15[0]+ '-', markerfmt=colors_15[0]+ 'o', basefmt=' ' )
plt.stem(Cluster_number_x_15[1], DEV_PCA_CL_per_y_15[1], linefmt=colors_15[1]+ '-', markerfmt=colors_15[1]+ 'o', basefmt=' ', bottom=DEV_PCA_CL_per_y_15[0])
plt.stem(Cluster_number_x_15[2], DEV_PCA_CL_per_y_15[2], linefmt=colors_15[2]+ '-', markerfmt=colors_15[2]+ 'o', basefmt=' ',bottom=DEV_PCA_CL_per_y_15[1])


# Plot dei punti speciali con colori diversi per il Cluster da 20
colors_20 = ['C1', 'C2', 'C3']
plt.stem(Cluster_number_x_20[0], DEV_PCA_CL_per_y_20[0], linefmt=colors_20[0]+ '-', markerfmt=colors_20[0]+ 'o', basefmt=' ' )
plt.stem(Cluster_number_x_20[1], DEV_PCA_CL_per_y_20[1], linefmt=colors_20[1]+ '-', markerfmt=colors_20[1]+ 'o', basefmt=' ', bottom=DEV_PCA_CL_per_y_20[0])
plt.stem(Cluster_number_x_20[2], DEV_PCA_CL_per_y_20[2], linefmt=colors_20[2]+ '-', markerfmt=colors_20[2]+ 'o', basefmt=' ',bottom=DEV_PCA_CL_per_y_20[1])

# Linee tratteggiate parallele all'asse y
x_line = np.arange(0, 26)  # Valori x per le linee
DEV_PCA_per = [81.0307, 86.2994, 90.5430]  # Posizioni delle linee sull'asse y
line_colors = ['orange', 'green', 'red']  # Colori delle linee
line_labels = ['3 P.C', '4 P.C', '5 P.C']  # Etichette delle linee

for DEV_PCA_per, line_color, line_label in zip(DEV_PCA_per, line_colors, line_labels):
    plt.plot(x_line, np.full_like(x_line, DEV_PCA_per), linestyle='--', color=line_color, linewidth=0.5, label=line_label)

# Etichette degli assi
plt.xlabel('Numero di Cluster')
plt.ylabel('Devianza post PCA e Clustering (%)')

# Imposta la formattazione percentuale per l'asse Y
formatter = FuncFormatter(percent_formatter)
plt.gca().yaxis.set_major_formatter(formatter)

# Aggiunta della legenda
plt.legend(loc='upper right')

# Spazio aggiuntivo per evitare sovrapposizioni
plt.tight_layout()

# Visualizzazione del grafico
plt.show()
