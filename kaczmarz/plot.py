from matplotlib import pyplot as plt

from . import linsys

def itrplot():
	sys = linsys.normal(1000, 10)
	plt.plot([1,2,3])
	plt.show()