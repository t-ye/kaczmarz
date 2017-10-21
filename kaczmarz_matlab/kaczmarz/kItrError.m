function error = kItrError(A, x, b, itrType, itrs)
% KITRERROR returns the magnitude of the error vector after iterations
% of the Kaczmarz algorithm.
%
% errors = kItrErrors(A, x, b, itrType, itrs) applies the Kaczmarz
% algorithm to the linear system Ax = b - with the zero vector as the
% initial guess - numItrs times, using itrType as a strategy for generating 
% row indices. The norm of the final error vector is returned.
%
% See also:
% ROWITERATOR
    xEst = zeros(size(x));
    rowItr = RowIterator({A, x, b}, itrType);
    for i = 1:itrs
        xEst = kaczmarz(A, b, rowItr.next(), xEst);
    end
    error = norm(xEst - x);
end