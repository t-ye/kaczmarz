function svrsPlot()
    rows = 1000;
    cols = 10;
    itrs = 100;
    trials = 20;
    highRowFracs = linspace(1/16, 1/12, 10)
    itrTypeWeights = linspace(0, 100, 10);
    optimalWeight = zeros(1, numel(highRowFracs));
    parfor i = 1:numel(highRowFracs)
        itrTypeErrors = zeros(1, numel(itrTypeWeights));
        for j = 1:trials
            [A, x, b] = svrs(rows, cols, highRowFracs(i));
            for k = 1:numel(itrTypeWeights)
                itrTypeErrors(k) = itrTypeErrors(k) + svrsItrError(A, x, b,...
                    weightToRandItrType(itrTypeWeights(k)), itrs,...
                    highRowFracs(i)) / norm(x);
            end
        end
        optimalWeight(i) = itrTypeWeights(minIdx(itrTypeErrors));
        i
    end
    plot(highRowFracs, optimalWeight, '*');
end