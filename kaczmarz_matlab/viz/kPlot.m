function kPlot(paramMap)
% KPLOT Plots relative error against iteration count after application of
% the Kaczmarz algorithm, using the provided dimensions of the system, row
% iteration types, maximum iteration count, and number of systems to
% average over.
    
    %% Sets default parameter mappings.
    if nargin == 0, paramMap = containers.Map; end
    rows = addMappingIfAbsent(paramMap, 'rows', 1000);
    cols = addMappingIfAbsent(paramMap, 'cols', 10);
    trials = addMappingIfAbsent(paramMap, 'trials', 100);
    itrs = addMappingIfAbsent(paramMap, 'itrs', 250);
    itrTypes = addMappingIfAbsent(paramMap, 'itrTypes', standardRandItrTypes);
    sysGen = addMappingIfAbsent(paramMap, 'sysGen', @sixteenthScaledVarRS);
    sysGenParams = addMappingIfAbsent(paramMap, 'sysGenParams', {});
    dynamicLevel = addMappingIfAbsent(paramMap, 'dynamicLevel', 10);
    figDir = addMappingIfAbsent(paramMap, 'figDir',...
        'C:\Users\lightningleaf\Google Drive\Internship\MATLAB\figures\');
    if paramMap.length() > 9, warning('Extraneous parameters'); end
    %% Sets values dependent on paramters.
    figPath = strcat(figDir, sprintf('%s+%s on %dx%d (%g trials).fig',...
        func2str(sysGen), cell2matstr(sysGenParams), rows, cols, trials));
    itrTypeErrors = repcell(zeros(1, itrs), numel(itrTypes));
    %% User prompt if overwrite.
    doSave = false;
    if doSave, [doSave, figPath] = overwriteInput(figPath); end
    if doSave, fprintf('Creating file: %s\n', figPath); end
    %% Retrieves and sums the relative errors.
    figure;
    for i = 1:trials 
        fprintf('Current trial: %g\n', i);
        [A, x, b] = sysGen(rows, cols, sysGenParams{:});
        parfor j = 1:numel(itrTypes)
                itrTypeErrors{j} = itrTypeErrors{j}...
                    + kItrErrors(A, x, b, itrTypes{j}, itrs) / norm(x);
        end
        if rem(i, dynamicLevel) == 0
            drawKPlot(itrTypeErrors, i, paramMap);
        end
    end
    %% Plots the relative errors, averaged, in a semilog graph.
    if dynamicLevel == 0 || rem(i, dynamicLevel) ~= 0
        drawKPlot(itrTypeErrors, trials, paramMap);
    end
    %% Saves the graph, if necessary.
    if doSave, savefig(figPath); disp('File saved succesfully.'); end
    %%
end

function drawKPlot(itrTypeErrors, trial, pMap)
    for i = 1:numel(pMap('itrTypes'))
        semilogy(itrTypeErrors{i} / trial);
        hold on;
    end
        ylabel('Ratio of error to solution vector norms, averaged (log scale)'); 
        xlabel('Iteration #');
    title(sprintf('Kaczmarz error, %s+%s on %dx%d (trial %g of %g)',...
        func2str(pMap('sysGen')), cell2matstr(pMap('sysGenParams')),...
        pMap('rows'), pMap('cols'), trial, pMap('trials')));
    legend(pMap('itrTypes'));
    
    drawnow;
    hold off;
end