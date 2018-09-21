%% Calculate Period For Each Peak
% This function was designed to determine the time between each peak. The
% absolute value of the data is taken and the time between each zero value
% is recorded. 

function zero = Zero(filtered_data)
    ctr = 1;
    for ii = 2:length(filtered_data)
        if (filtered_data(ii-1) > 0) && (filtered_data(ii) < 0)
            zero(ctr) = ii;
            ctr = ctr + 1;
        elseif (filtered_data(ii-1) < 0) && (filtered_data(ii) > 0)
            zero(ctr) = ii;
            ctr = ctr + 1;                
        end
    end
end