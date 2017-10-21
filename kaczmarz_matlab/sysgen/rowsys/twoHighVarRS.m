function [A, x, b] = twoHighVarRS(rows, cols)
% TWOHIGHVARRS generates a system with normally distributed coefficient 
% matrix and solution vector, except two of the rows in the coefficient 
% matrix has variance 100. A slight amount of noise has been added to 
% better contrast different row iteration strategies.
    A = randn(rows, cols);
    for i = 1:size(A, 1)
        A(i, :) = zscore(A(i, :));
    end
    
    highRow = randperm(rows, 2);
    A(highRow(1), :) = A(highRow(1), :) * 10 ^ 2;
    A(highRow(2), :) = A(highRow(2), :) * 10 ^ 2;
    
    x = zscore(randn(cols, 1));
    e = zscore(randn(rows, 1)) * 0.1 ^ 2;
    
    b = A * x + e;
end