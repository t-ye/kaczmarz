function errors = kItrErrors(A, x, b, itrType, itrs)
% KITRERRORS returns a vector of the magnitude of the error vectors after 
% each iteration of the Kaczmarz algorithm. This is suitable for plotting 
% against that very iteration count.
%
% errors = kItrErrors(A, x, b, itrType, itrs) applies the Kaczmarz
% algorithm to the linear system Ax = b - with the zero vector as the
% initial guess - numItrs times, using itrType as a strategy for generating 
% row indices. The norm of the error vector is appended to errors after
% each iteration.
%
% See also:
% ROWITERATOR
    xEst = zeros(size(x));
    errors = zeros(1, itrs);
    rowItr = RowIterator({A, x, b}, itrType);
    for i = 1:itrs
        xEst = kaczmarz(A, b, rowItr.next(), xEst);
        errors(i) = norm(x - xEst);
    end
end