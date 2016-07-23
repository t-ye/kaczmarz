# from time import time
# print()
# t = time()

# import numpy as np
# import timeit

from bisect import bisect
from numpy import cumsum
from numpy.linalg import norm

from random import randrange
from random import uniform

def cumdist_bisect_skip(p, skipi):
	# pr - sublist of cumulative probability p that needs to be (r)educed to avoid dl
	# dl - probability at the (l)ast index
	# pl - cumulative probability at the (l)ast index
	pr = p[skipi+1:]

	# Stores the probability density contributed at skipi. 
	pl = p[skipi]
	# Calculates the probability density contributed at skipi.
	dl = pl - (skipi > 0) * p[skipi-1] # don't subtract if skipi == 0
	
	# Effectively removes the probability density contributed at skipi.
	p[skipi] = p[skipi-1] if skipi > 0 else p[skipi+1]
	pr -= dl
	# Performs the bisection.
	i = bisect(p, uniform(0, p[-1])) # div * (p[-1] - dl) / p[-1]
	if i == skipi:
		# Takes into account that, if i == skipi, i actually represents an adjacent cumulative probability.
		i += -1 if skipi > 0 else 1

	# Restores the probability density contributed at skipi.
	p[skipi] = pl
	pr += dl

	return i

def relnorm(v1, v2):
	return norm(v1 - v2) / norm(v1)