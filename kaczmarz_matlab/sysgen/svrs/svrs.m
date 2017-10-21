function [A, x, b] = svrs(rows, cols, highRowFrac)
%SVRS is an acronym for "scaled variance row system." The coefficient
%matrix uses normally distributed rows as a template. Then a fraction of
%the rows are multiplied so as to give them distinct variances, starting
%from 1 and counting upwards. The solution vector is normally distributed,
%and the constant vector is made to have a slight amount of noise so as to
%bring out differences between different types of iterative solvers.
    A = randn(rows, cols);
    scale = randperm(ceil(rows * highRowFrac));
    scaleRowIdx = randperm(rows, ceil(rows * highRowFrac));
    for i = 1:size(A, 1)
        A(i, :) = zscore(A(i, :));
    end
    for i = 1:numel(scaleRowIdx)
        A(scaleRowIdx(i), :) = A(scaleRowIdx(i), :) * scale(i);
    end
    
    x = zscore(randn(cols, 1));
    e = zscore(randn(rows, 1)) * 0.1 ^ 2;
    
    b = A * x + e;
end
