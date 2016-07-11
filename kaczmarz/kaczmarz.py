import numpy as np
from recordclass import recordclass
import functools

def on(sys, idxs):
	A,x,b = sys
	for i in idxs:
		row = A[i,:]
		x -= (row @ x - b[i]) / (row @ row) * row

def gen(sys, idxs):
	A,x,b = sys
	for i in idxs:
		row = A[i,:]
		x -= (row @ x - b[i]) / (row @ row) * row
		yield np.copy(x)
