from recordclass import recordclass

from numpy.random import randn

linsys = recordclass('linsys', 'A x b')

def normal(rows, cols):
	sys = linsys(randn(rows, cols), randn(cols), None)
	sys.b = sys.A @ sys.x
	return sys