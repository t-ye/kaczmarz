function itrTypes = spacedRandItrTypes(space)
%SPACEDRANDITRTYPES returns partially weighted sampling row iteration 
%methods, the weighted frequency of which is determined by spaces between
%each distinct method. 0% and 100% will always be included.
    % Adds 1 space to ensure rand100 is included.
    itrTypes = cell(1, ceil(100 / space) + (rem(100, space) == 0));
    for i = 1:numel(itrTypes)
        itrTypes{i} = weightToRandItrType(space * (i - 1));
    end
    %TODO: make a version based on a generator function.
end