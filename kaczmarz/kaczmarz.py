from recordclass import recordclass
import numpy as np

def on(sys, itrs):
	for i in itrs:
		row = sys.A[i, :]
		rej = (row @ sys.x - sys.b[i]) / (row @ row) * row
		sys.x -= rej
	return np.copy(x)


A = np.array([[1, 0], [-1, 1]])
x = np.zeros(2) 
b = np.array([2, 2])

linsys = recordclass('linsys', 'A x b')

sys = linsys(A, x, b)
kaczmarz.kaczmarz(sys, [0])
print(x)