function cell = repcell(elem, count)
% REPCELL creates a cell vector with a repeated element within its cells.
%
% cell = repcell(elem, count) creates a cell vector with count number of
% repetitions of elem, with each instance placed in its own cell.
    elem = {elem};
    cell = repmat(elem', count,1)';
end