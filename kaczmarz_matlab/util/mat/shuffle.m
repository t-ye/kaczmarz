function V = shuffle(v)
% SHUFFLE shuffles a vector.
%
% V = shuffle(v) sets V to a shuffled version of v. v itself is not
% changed.
%
    V = v(randperm(length(v)));
end