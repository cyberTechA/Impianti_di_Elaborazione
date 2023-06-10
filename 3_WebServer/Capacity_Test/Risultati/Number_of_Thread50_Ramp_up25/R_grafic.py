import matplotlib.pyplot as plt

x = [250, 750, 1250, 1650, 2000, 2500, 3000, 4000]
y = [0, 250, 500, 750, 1000]
Response_Time = [50.95,47.458,64.696046,88.78114,525.740604,921.842684,1114.47055,1313.769061]
plt.xlim(0,4000)
plt.ylim(0,1000)
plt.plot(x, Response_Time,color='yellow')
plt.xlabel('CTT')
plt.ylabel('Response Time')
plt.xticks(x)  # Imposta i valori dell'asse x
plt.yticks(y)  # Imposta i valori dell'asse y
plt.grid(True)
plt.show()
