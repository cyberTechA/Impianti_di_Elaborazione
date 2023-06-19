import matplotlib.pyplot as plt

x = [250, 750, 1250, 1650, 2000, 2500, 3000, 4000]
y = [0, 10, 20, 30, 40, 50]
Throughput = [4.333535565, 12.66996086, 20.99333333, 27.6482334, 31.66322779, 30.12917743, 29.26811379, 28.715073]
plt.xlim(0,4000)
plt.ylim(0,50)
    
plt.plot(x, Throughput)
plt.xlabel('CTT')
plt.ylabel('Throughput')
plt.xticks(x)  # Imposta i valori dell'asse x
plt.yticks(y)  # Imposta i valori dell'asse y
plt.grid(True)
plt.show()
