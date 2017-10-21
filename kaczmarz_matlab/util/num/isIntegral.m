function bool = isIntegral(x)
    bool = ~ischar(x) && isreal(x) && numel(x) == 1 && rem(x, 1) == 0;
end