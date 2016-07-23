import itertools as it

import numpy 
import numpy as np

from . import gen
from . import linsys
from . import rowitr
from . import util

from matplotlib import pyplot as plt

def itrplot():
	plt.figure()
	sys = linsys.normal(1000, 10)
	X,sys.x = sys.x,np.zeros(10)
	kgen = gen(sys, range(3))
	plt.plot(util.relnorm(X, list(kgen)))
	plt.show(block=False)

def rndplot():
	plt.figure()
	sys = linsys.normal(1000, 10)
	X,sys.x = sys.x,np.zeros(10)
	kgen = gen(sys, it.islice(rowitr.rnd(sys.A), 3))
	plt.plot(util.relnorm(X, list(kgen)))
	plt.show(block=False)