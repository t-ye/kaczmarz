function idx = minIdx(A)
% MAXIDX returns the index of the minimum value in an array. Note that if
% the array has more than one dimension, the linear indexing is returned.
%
% idx = maxIdx(A) sets idx to be the linear index of A such that A(idx) is
% the minimum element of A.
%
    [~, idx] = min(A(:));
end