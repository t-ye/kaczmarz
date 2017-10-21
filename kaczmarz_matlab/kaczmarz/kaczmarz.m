function X = kaczmarz(A, b, i, x)
% KACZMARZ Performs one iteration of the Kaczmarz algorithm.
%
% X = KACZMARZ(A, b, i, x) applies the Kaczmarz algorithm to the linear
% system Ax' = b using the ith row of A and x as an initial approximation
% to x'.
% 
%
    row = A(i, :);
    X = x + ( b(i) - (row * x) ) / (row * row') * row';
end