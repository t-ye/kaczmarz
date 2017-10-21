function newFilePath = fileNameAvoidOverwrite(filePath)
% FILENAMEAVOIDOVERWRITE "increments" a file path (adds an ordinal suffix) to a
% file until it does not share the same with one already existing, and so
% will not overwrite when created.
    i = 0;
    [pathstr, name, ext] = fileparts(filePath);
    if regexp(name(end-3:end), '(\d)')
        name = name(1:end-4);
    end
    while exist([pathstr '\' name ' (' num2str(i + 1) ')' ext], 'file')
        i = i + 1;
    end
    if i ~= 0
        newFilePath = fullfile(pathstr, [name ' (' num2str(i) ')' ext]);
    else
        newFilePath = fullfile(pathstr, [name ext]);
    end
end