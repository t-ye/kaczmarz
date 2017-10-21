function errors = kGreedyItrErrors(A, x, b, itrs)
% KGREEDYITRERRORS returns a vector of the magnitude of the error vectors 
% after each iteration of the Kaczmarz algorithm. This is suitable for 
% plotting against that very iteration count. 
%
% This function differs from KITRERRORS in that it chooses rows greedily -
% whichever row will bring the estimate closest to the solution vector, if
% any. Since it has to consider each row, this is a very slow row iteration
% method.
%
% errors = kGreedyItrErrors(A, x, b, rowItr, numItrs) applies the Kaczmarz
% algorithm to the linear system Ax = b - with the zero vector as bringthe
% initial guess - numItrs times, using greedy decision-making to choose the 
% next row. The norm of the error vector is appended to errors after each 
% iteration.
%
% See also:
% ROWITERATOR
    xEst = zeros(size(x));
    errors = zeros(1, itrs);
    for i = 1:itrs
        diffs = zeros(1, itrs);
        for j = 1:size(A, 1)
            %if norm(x - kaczmarz(A, b, j, xEst)) <= norm(x - xEst)
                diffs(j) = norm(xEst - kaczmarz(A, b, j, xEst));
            %end
        end
        xEst = kaczmarz(A, b, maxIdx(diffs), xEst);
        errors(i) = norm(x - xEst) / norm(x); % / norm(x);
    end
end