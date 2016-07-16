import itertools as it

import numpy as np
import timeit
import util

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
	return util.rnd((A**2).sum(axis=1))

# def test(A):
# 	gen = rndw(A)

# setup = '''
# import numpy as np
# A = (np.arange(9) + 1).reshape(3, 3)
# from __main__ import test
# 	'''
# print(min(timeit.Timer('test(A)', setup=setup).repeat(10,10)))