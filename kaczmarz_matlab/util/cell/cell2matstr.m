function str = cell2matstr(cell)
%CELL2MATSTR converts a cell to a string as if it were a matrix.
    str = strcat('[', mat2str(cell2mat(cell)), ']');
end

