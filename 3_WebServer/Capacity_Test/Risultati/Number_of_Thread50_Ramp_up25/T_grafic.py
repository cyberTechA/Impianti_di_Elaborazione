import matplotlib.pyplot as plt

x_reference = [250, 750, 1250, 1650, 2000, 2500, 3000, 4000]
y_reference = [0, 10, 20, 30, 40, 50]
y = [4.333535565, 12.66996086, 20.99333333, 27.6482334, 31.66322779, 30.12917743, 29.26811379, 28.715073]

plt.plot(x_reference, y)
plt.xlabel('Asse X')
plt.ylabel('Asse Y')
plt.title('Grafico del vettore')
plt.xticks(x_reference)  # Imposta i valori dell'asse x
plt.yticks(y_reference)  # Imposta i valori dell'asse y
plt.grid(True)
plt.show()
