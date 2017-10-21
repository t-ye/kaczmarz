function p = normDist(A)
% NORMDIST returns a probability distribution of the rows of a matrix
% weighted by the Euclidean norm of each row.
%
% p = normDist(A) set p to be a probability distribution of the rows of A
% weighted on the norms of the rows.
%
    p = zeros(1, size(A, 1));
    sampleSpace = norm(A, 'fro') ^ 2;
    for i = 1:length(p)
        p(i) = A(i, :) * A(i, :)' / sampleSpace;
    end
end