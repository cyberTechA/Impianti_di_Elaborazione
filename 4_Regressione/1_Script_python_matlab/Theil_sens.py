import numpy as np
import pandas as pd
from scipy.stats.mstats import theilslopes
from matplotlib import pyplot as plt

def main():
    df = pd.read_excel("VMS3.xlsx")
    x = np.array(df["T(s)"])
    y = np.array(df["allocated heap"])
    slope, intercept, low, up = theilslopes(y, x, 0.95)

    # Salvataggio della print su file txt
    print("Pendenza: {} \nIntervallo di confidenza al 95%: [{},{}]  \nIntercetta: {}".format(slope, low, up, intercept))
    print_data = "Pendenza: {}\nIntervallo di confidenza al 95%: [{},{}]\nIntercetta: {}".format(slope, low, up, intercept)
    print_file_path = "allocated heap.txt"  # Specifica il percorso e il nome del file di print
    with open(print_file_path, "w") as file:
        file.write(print_data)

    plt.scatter(x, y)
    plt.plot(x, slope*x + intercept, color='r')
    plt.plot(x, low*x + intercept, color='g')
    plt.plot(x, up*x + intercept, color='b')
    plt.xlabel('X')
    plt.ylabel('Y')
    
    plot_file_path = "allocated heap.png"  # Specifica il percorso e il nome del file del plot
    plt.savefig(plot_file_path)  # Salvataggio del plot su file immagine
    
    plt.show()

if __name__ == "__main__":
    main()
