function idx = maxIdx(A)
% MAXIDX returns the index of the maximum value in an array. Note that if
% the array has more than one dimension, the linear indexing is returned.
%
% idx = maxIdx(A) sets idx to be the linear index of A such that A(idx) is
% the maximum element of A.
%
    [~, idx] = max(A(:));
end