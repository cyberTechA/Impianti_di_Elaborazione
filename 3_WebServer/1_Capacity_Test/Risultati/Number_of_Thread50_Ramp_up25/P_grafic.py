import matplotlib.pyplot as plt

x = [250, 750, 1250, 1650, 2000, 2500, 3000, 4000]
y = [0.00, 0.25, 0.50, 0.75, 1.00,1.25]
Pawer = [0.085054673,0.266972078,0.324445637,0.311404373,0.060225951,0.03280596,0.0262619,0.021830466]

plt.xlim(0,4000)
plt.ylim(0.00,1.25)
plt.plot(x, Pawer,color='red')
plt.xlabel('CTT')
plt.ylabel('Pawer')
plt.xticks(x)  # Imposta i valori dell'asse x
plt.yticks(y)  # Imposta i valori dell'asse y
plt.grid(True)
plt.show()
