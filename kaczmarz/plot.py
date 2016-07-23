import itertools as it

import numpy 
import numpy as np

from . import gen
from . import linsys
from . import util
from matplotlib import pyplot as plt

def itrplot():
	sys = linsys.normal(1000, 10)
	X,sys.x = sys.x,np.zeros(10)
	kgen = gen(sys, [1,2,3])
	plt.plot([1] + [util.relnorm(X, x) for x in kgen])