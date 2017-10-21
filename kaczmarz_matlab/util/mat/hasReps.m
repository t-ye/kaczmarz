function bool = hasReps(A)
% HASREPS detects if an array contains any repeated elements.
%
% bool = hasReps(A) sets bool to true if A has any repeated elements, and
% to false otherwise.
%
    bool = false;
    for i = 1:numel(A)
        for j = 1:(i - 1)
            if A(i) == A(j)
                bool = true;
                return;
            end
        end
    end
end