function str = strcell2str(strcell, separator)
% STRCELL2STR converts a cell of strings to a single continguous string.
    if ~exist('separator', 'var')
        separator = ', ';
    end
    str = strcat('{', strcell{1});
    for i = 2:numel(strcell);
        str = [str separator strcell{i}];
    end
    str = strcat(str, '}');
end