function [A, x, b] = normalRS(rows, cols)
% NORMALRS generates a system with normally distributed coefficient 
% matrix and solution vector. A slight amount of noise also been added to 
% better contrast different row iteration strategies.
    A = randn(rows, cols);
    for i = 1:rows
        A(i, :) = zscore(A(i, :));
    end
    
    x = zscore(randn(cols, 1));
    
    e = zscore(randn(rows, 1)) * 0.1 ^ 2;
    b = A * x + e;
end