import random
import itertools as it
def itr(A):
	rows = len(A)
	return (i % rows for i in it.count())

def rndu(A):
	rows = len(A)
	i = random.randrange(rows)
	last = None
	while 1:
		yield i
		last,i = i,random.randrange(rows - 1)
		if i >= last:
			i += 1