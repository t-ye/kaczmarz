def kaczmarz(sys, itrs):
	for i in itrs:
		row = sys.A[i, :]
		rej = (sys.b[i] - row @ row) / (row @ row) * row
		sys.x -= rej