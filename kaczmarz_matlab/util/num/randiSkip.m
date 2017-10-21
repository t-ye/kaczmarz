function x = randiSkip(imax, skip) 
% RANDISKIP generates uniformly distributed positive integers, skipping a 
% given value.
%
% x = randi_skip(imax, skip) returns a pseudorandom scalar integer between 
% 1 and imax, excluding skip. If skip is out of the given range, this 
% function is equivalent to randi(imax).
% 
% See also:
% RANDI
in = randi(imax - 1);
if (in >= skip)
    in = in + 1;
end
x = in;