function [A, x, b] = quarterScaledVarRS(rows, cols)
% QUARTERSCALEDVARRS generates a system with a normally distributed solution 
% vector. 1/4th of the rows of the coefficient matrix have distinct
% variances, between one and 1/4th the row count.  A slight amount of noise 
% has been added to better contrast different row iteration strategies.
    A = randn(rows, cols);
    scale = randperm(ceil(rows / 4));
    scaleRowIdx = randperm(rows, ceil(rows / 4));
    for i = 1:numel(scaleRowIdx)
        A(scaleRowIdx(i), :) = zscore(A(scaleRowIdx(i), :)) * scale(i);
    end
    
    x = zscore(randn(cols, 1));
    e = zscore(randn(rows, 1)) * 0.1 ^ 2;
    
    b = A * x + e;
end