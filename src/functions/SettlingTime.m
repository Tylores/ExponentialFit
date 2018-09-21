%% Calculate Settling Time
% This function was designed to determine the settling time of an
% underdamped second order system. This also outputs the start and stop
% time of the data that is applicable.

function [start_t, stop_t, set_t] = SettlingTime(filtered_data)
    [impulse_mag, impulse_idx] = max(-filtered_data);
    n = size(filtered_data);
    zero = Zero(filtered_data(impulse_idx:n));
    
    t1 = impulse_idx + zero(2);
    t2 = impulse_idx + zero(3);
    [start_mag, start_idx] = max(-filtered_data(t1:t2));

    start_t = t1 + start_idx;
    period = t2-t1;
    stop_t = start_t + 5*period;
    set_t = stop_t - start_t;
end