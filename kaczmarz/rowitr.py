import itertools as it

import numpy as np
import timeit

from kaczmarz import rowitr

from random import random
from random import randrange

def itr(A):
	rows = len(A)
	return (i % rows for i in it.count()) # optimizable

def rndu(A):
	rows = len(A)
	last,i = None,randrange(rows)
	while 1:
		yield i
		last,i = i,randrange(rows - 1)
		if i >= last:
			i += 1

def rndw(A):

	return util.prob_dist_gen((A**2).sum(axis=1))

def rnd(A, pcntu = .5):
	if pcntu == 0:
		return rndw(A)
	elif pcntu == 1:
		return rndu(A)
	itr_types = (rndu(A), rndw(A))
	last,i = None,itr_types[random() < pcntu].__next__()
	while 1: 
			yield i
			last,i = i,itr_types[random() < pcntu].__next__() # what if diff itr types conflict

# def test(A):
# 	gen = rndw(A)

# setup = '''
# import numpy as np
# A = (np.arange(9) + 1).reshape(3, 3)
# from test
# 	'''
# print(min(timeit.Timer('test(A)', setup=setup).repeat(10,10)))