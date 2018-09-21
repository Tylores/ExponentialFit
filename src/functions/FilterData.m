%% FILTER DATA
% Define the num/den coefficients of the rational transfer function. where
% (a) is the denominator and (b) is the numerator. Then calculate the
% moving-average of the data that maintains 20% goodness of fit.
%
% As of right now the filter goodness of fit seems to be low, but it is too
% difficult to work with the data as it is. I need to look into some more
% advance filtering techniques. 

function filtered_data = FilterData(data)
    gof = 1;
    ii = 3;
    while gof > 0.2
        windowSize = ii; 
        a = 1;
        b = (1/windowSize)*ones(1,windowSize);
        filtered_data = filter(b,a,data);
        gof = goodnessOfFit(data,filtered_data,'NRMSE');
        ii = ii + 2;
    end
end