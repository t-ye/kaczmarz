%FIGTOIMG saves figures as .png images.
function figToImg()
    [figFile, figDir] = uigetfile('*.fig','Select a MATLAB figure');
    figPath = fullfile(figDir, figFile);
    [~, imgName, ~] = fileparts(figFile);
    imgPath = fullfile(figDir, 'images', [imgName '.png']);
    [doWrite, imgPath] = overwriteInput(imgPath);
    if doWrite
        openfig(figPath, 'new', 'invisible');
        saveas(gcf,imgPath);
        close gcf;
        disp(strcat('Image saved as:', imgPath));
    else
        disp('Image not created.');
    end
end