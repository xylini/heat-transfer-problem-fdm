#! /usr/local/bin/python3
from subprocess import call
import matplotlib.pyplot as plt



call(['./run_all.sh'])

errors4 = []
errors8 = []
errors16 = []
file1 = open('./hes4.txt', 'r')
file2 = open('./hes8.txt', 'r')
file3 = open('./hes16.txt', 'r')

for line in file1:
    errors4.append(float(line))
file1.close()

for line in file2:
    errors8.append(float(line))
file2.close()

for line in file3:
    errors16.append(float(line))
file3.close()


plt.gca()


plt.ylabel('Error')
plt.xlabel('Probe')
plt.title('Precision = 4')
plt.plot(range(1000), errors4, 'ro', markersize=5)
plt.show()

plt.ylabel('Error')
plt.xlabel('Probe')
plt.title('Precision = 8')
plt.plot(range(1000), errors8, 'go', markersize=5)
plt.show()

plt.ylabel('Error')
plt.xlabel('Probe')
plt.title('Precision = 16')
plt.plot(range(1000), errors16, 'bo', markersize=5)
plt.show()

