function itrTypes = standardItrTypes(range)
% STANDARDITRTYPES returns a listing of all row iteration types implemented (for 
% the Kaczmarz algorithm).
%
% itrTypes = allItrTypes sets itrTypes to be the short naming of all row 
% iteration types implemented so far.
%
% itrTypes = allItrTypes(idx) sets itrType to the short naming of the 
% row iteration type at position(s of) idx when allItrTypes is called. Note
% that idx may be of multiple numbers (e.g., a range).
%
%
    idxs = 0;
    if nargin > 0 && isIntegral(range)
        idxs = range;
    end
    
    itrTypes = {'itr', 'rand0', 'rand25', 'rand50', 'rand75', 'rand100'};
    
    if numel(idxs) == 1 && idxs ~= 0
        itrTypes = itrTypes{idxs}; 
    elseif numel(idxs) > 1
        itrTypes = itrTypes(idxs); 
    end
    
end