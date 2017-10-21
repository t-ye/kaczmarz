function [doWrite, filePath] = overwriteInput(filePath)
%OVERWRITEPROMPT prompts for overwrite, writing to a new file path, or not
%writing at all.
    if ~exist(filePath, 'file')
        doWrite = true;
    else
        doWrite = boolInput(['File ' strrep(filePath, '\', '\\') ' exists. Overwrite?']);
        if ~doWrite
            doWrite = boolInput('Rename new file?');
            if doWrite
                filePath = fileNameIncrement(filePath);
            end
        end
    end
end

