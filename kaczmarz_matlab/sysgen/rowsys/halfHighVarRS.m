function [A, x, b] = halfHighVarRS(rows, cols)
% TWOHIGHVARRS generates a system with normally distributed coefficient 
% matrix and solution vector, except half of the rows in the coefficient 
% matrix has variance 100. A slight amount of noise has been added to 
% better contrast different row iteration strategies.
    A = randn(rows, cols);
    for i = 1:size(A, 1)
        A(i, :) = zscore(A(i, :));
    end
     
    highRow = randperm(rows, rows / 2);
    for i = 1:numel(highRow)
        A(highRow(i), :) = A(highRow(i), :) * 100;
    end
    
    x = zscore(randn(cols, 1));
    e = zscore(randn(rows, 1)) * 0.1 ^ 2;
    
    b = A * x + e;
end