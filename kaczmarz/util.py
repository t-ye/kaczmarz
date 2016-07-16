# from time import time
# print()
# t = time()

import numpy as np
import timeit

from bisect import bisect
from math import isclose
from numpy import cumsum

from random import uniform

def bisect_nd(dist, p, last, div):
	# pr - sublist of cumulative probability p tha tneeds to be (r)educed to avoid dl
	# dl - probability at the (l)ast index
	# pl - cumulative probability at the (l)ast index
	pr = p[last+1:]
	dl = dist[last]
	pr -= dl

	pl = p[last]
	p[last] = p[last-1]

	i = bisect(p, div - div * dl) # div * (p[-1] - dl)
	if i == last:
		if i == 0:
			i == len(p) 
		i -= 1 # i = (i - 1) % len(p)

	p[last] = pl
	pr += dl
	return i

def rnd(dist):
	p = cumsum(dist)
	last,i = None,bisect(p, uniform(0, p[-1]))
	while 1:
		yield i
		last,i = i,bisect_nd(dist, i, last, uniform(0, p[-1]))

# def test():
# 	dist = [.1, .2, .4, .3]
# 	p = cumsum(dist)
# 	# P = np.copy(p)
# 	last = 1
# 	gen = (bisect_nd(dist, p, last, rand()) for _ in range(1000))
# 	for _ in gen:
# 		pass

# # test()
# # print('\n(', round(time() - t, 5), ' s)', sep='')

# setup += '''
# from __main__ import test
# 	'''
# print(min(timeit.Timer('test()', setup=setup).repeat(10,5)))


# # print('\n(', round(time() - t, 5), ' s)', sep='')
