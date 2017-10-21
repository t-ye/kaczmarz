function [A, x, b] = halfScaledVarRS(rows, cols)
% HALFSCALEDVARRS generates a system with a normally distributed solution 
% vector. Half of the rows of the coefficient matrix have distinct
% variances, between one and half the row count.  A slight amount of noise 
% has been added to better contrast different row iteration strategies.
    A = randn(rows, cols);
    scale = randperm(ceil(rows / 2));
    scaleRowIdx = randperm(rows, ceil(rows / 2));
    for i = 1:numel(scaleRowIdx)
        A(scaleRowIdx(i), :) = zscore(A(scaleRowIdx(i), :)) * scale(i);
    end
    
    x = zscore(randn(cols, 1));
    e = zscore(randn(rows, 1)) * 0.1 ^ 2;
    
    b = A * x + e;
end