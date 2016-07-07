import numpy as np
from recordclass import recordclass


def on(sys, idxs):
	A, x, b = sys
	for i in idxs:
		row = A[i, :]
		rej = (row @ x - b[i]) / (row @ row) * row
		x -= rej
	return np.copy(x)

def gen(sys, idxs):
	for i in idxs:
		row = sys.A[i, :]
		rej = (row @ sys.x - sys.b[i]) / (row @ row) * row
		sys.x -= rej
		yield np.copy(sys.x)