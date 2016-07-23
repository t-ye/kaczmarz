import numpy 
import numpy as np

from . import gen
from . import linsys
from matplotlib import pyplot as plt

def itrplot():
	sys = linsys.normal(1000, 10)
	X,sys.x = sys.x,np.zeros(10)
	kgen = gen(sys, [1,2,3])
	plt.plot([np.linalg.norm(kgen.__next__() - X) for _ in range(3)])