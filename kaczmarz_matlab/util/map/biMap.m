function map = biMap(keys, values)
% BIMAP creates a bidirectional mapping between keys and values.
%
% map = biMap(keys, values) sets map to the mapping of each key in the keys 
% array to the value in the values array at the same index.
%
    if hasReps(keys) || hasReps(values)
        error('Non-unique keys or values.');
    end
    
    map = containers.Map(cat(1, keys(:), values(:)), cat(1, values(:), keys(:)));
end