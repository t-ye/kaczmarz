import numpy as np
from recordclass import recordclass

def on(sys, itrs):
	for i in itrs:
		row = sys.A[i, :]
		rej = (row @ sys.x - sys.b[i]) / (row @ row) * row
		sys.x -= rej
	return np.copy(sys.x)