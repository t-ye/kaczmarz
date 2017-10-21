function itrType = weightToRandItrType(weight)
%WEIGHTTORANDITRTYPE converts a numerical weight 
    if 0 <= weight <= 100
        itrType = ['rand' num2str(weight)];
    else
        error('Weight not between 0 and 100.');
    end
end

