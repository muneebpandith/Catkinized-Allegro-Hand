import numpy as np
import matplotlib.pyplot as plt
import csv
xval = []
yval = []
with open('test.csv') as f_input:
	reader = csv.reader(f_input, delimiter=';')
	for row in reader:

		xval.append(float(row[1]))
		yval.append(float(row[2]))

plt.ylim(-0.1, 0.1) 
plt.scatter(xval,yval)
plt.show()

