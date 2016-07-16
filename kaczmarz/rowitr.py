import itertools as it

from kaczmarz import util
from random import randrange

def itr(A):
	rows = len(A)
	return (i % rows for i in it.count())

def rndu(A):
	rows = len(A)
	last,i = None,randrange(rows)
	while 1:
		yield i
		last,i = i,randrange(rows - 1)
		if i >= last:
			i += 1

def rndw(A):
	row_norms = np.empty(len(A))
	for i in range(len(A)):
		row_norms[i] = sum(n for n in A[i,:])
	dist = row_norms / sum(row_norms)
	return util.rnd(dist)

A = (np.arange(9) + 1).reshape(3, 3)
print(A)
print(rndw(A))