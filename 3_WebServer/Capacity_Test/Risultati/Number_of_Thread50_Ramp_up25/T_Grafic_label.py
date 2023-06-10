import matplotlib.pyplot as plt

x = [250, 750, 1250, 1650, 2000, 2500, 3000, 4000]
y = [0, 10, 20, 30, 40, 50]
Throughput = [4.333535565, 12.66996086, 20.99333333, 27.6482334, 31.66322779, 30.12917743, 29.26811379, 28.715073]
plt.xlim(0,4000)
plt.ylim(0,50)
# Coordinate del punto in cui posizionare l'etichetta
x_label = 2000
y_label = 31.66322779
x_label_2 = 1250
y_label_2 = 20.99333333
# Testo dell'etichetta
label_text = 'Usable Capacity'
label_text_2 = 'Knee Capacity'
bbox_props = dict(boxstyle='round,pad=0.5', fc='white', ec='black', lw=2)
plt.annotate(label_text, xy=(x_label, y_label), xytext=(x_label, y_label+4),
             arrowprops=dict(facecolor='black', arrowstyle='->'),
             fontsize=8,bbox=bbox_props, fontweight='bold', color='red', ha='center')
plt.annotate(label_text_2, xy=(x_label_2, y_label_2), xytext=(x_label_2, y_label-8),
             arrowprops=dict(facecolor='black', arrowstyle='->'),
             fontsize=8,bbox=bbox_props, fontweight='bold', color='red', ha='right')
             
            
plt.plot(x, Throughput)
plt.xlabel('CTT')
plt.ylabel('Throughput')
plt.xticks(x)  # Imposta i valori dell'asse x
plt.yticks(y)  # Imposta i valori dell'asse y
plt.grid(True)
plt.show()
