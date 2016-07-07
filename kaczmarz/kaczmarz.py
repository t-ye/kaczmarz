import numpy as np
from recordclass import recordclass


def on(sys, itrs):
	A, x, b = sys
	for i in itrs:
		row = A[i, :]
		rej = (row @ x - b[i]) / (row @ row) * row
		x -= rej
	return np.copy(x)

def itrs(sys, itrs):
	for i in itrs:
		row = sys.A[i, :]
		rej = (row @ sys.x - sys.b[i]) / (row @ row) * row
		sys.x -= rej
		yield np.copy(sys.x)