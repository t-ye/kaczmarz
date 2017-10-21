function [A, x, b] = scaledVarRS(rows, cols)
% SCALEDROWVARSYS generates a system with normally distributed solution 
% vector, and coefficient matrix whose rows have distinct variances between 
% 1 and the number of rows of the system. A slight amount of noise has been 
% added to better contrast different row iteration strategies.
    A = randn(rows, cols);
    scale = shuffle(1:rows);
    for i = 1:rows
        A(i, :) = zscore(A(i, :)) * scale(i);
    end
    
    x = zscore(randn(cols, 1));
    e = zscore(randn(rows, 1)) * 0.1 ^ 2;
    
    b = A * x + e;
end