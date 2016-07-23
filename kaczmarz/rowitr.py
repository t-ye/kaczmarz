import itertools as it

from .util import cumdist_bisect_skip
from .util import randrange_skip
from bisect import bisect
from numpy import cumsum

from random import random
from random import randrange
from random import uniform

def itr(A):
	
	return it.cycle(range(len(A)))

def rndu(A):
	rows = len(A)
	last,i = None,randrange(rows)
	while 1:
		yield i
		i = randrange_skip(rows, i)

def rndw(A):
	p = cumsum((A**2).sum(axis=1))
	i = bisect(p, uniform(0, p[-1]))
	while 1:
		yield i
		i = cumdist_bisect_skip(p, i)

def rnd(A, pcntu = .5):
	rows = len(A)
	if pcntu == 0:
		yield from rndw(A)
	elif pcntu == 1:
		yield from rndu(A) # these are infinite, so no return needed after
	p = cumsum((A**2).sum(axis=1))
	i = randrange(rows) if random()<pcntu \
			else bisect(p,uniform(0, p[-1]))
	while 1:
		yield i
		i = randrange_skip(rows,i) if random()<pcntu \
				else cumdist_bisect_skip(p, i)

# def rnd(A, pcntu = .5):
# 	if pcntu == 0:
# 		yield from rndw(A)	
# 	elif pcntu == 1:
# 		yield from rndu(A) # these are infinite, so no return needed after
# 	itr_types = (rndu(A), rndw(A))
# 	last,i = None,itr_types[random() < pcntu].__next__()
# 	while 1: 
# 		yield i
# 		while i == last:
# 			last,i = i,itr_types[random() < pcntu].__next__() # what if diff itr types conflictq

# def _rndu(A):
# 	rows = len(A)
# 	i = randrange(rows)
# 	while 1:
# 		yield i
# 		i = randrange_skip(rows, i)
