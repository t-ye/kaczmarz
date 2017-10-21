function newValue = addMappingIfAbsent(map, key, value)
% ADDMAPPINGIFABSENT adds a key-value pair to a map if the key is absent
% or, if it does exist, the value of that key is empty. The new or
% unchanged value is returned.
%
% value = addMappingIfAbsent(map, key, value) adds the mapping of key to 
% value to map if key is not already a key in map, or, if it does exist, 
% the value of key is empty. The new or unchanged value is returned.
    if ~map.isKey(key) || isempty(map(key)), map(key) = value; end
    newValue = map(key);
end