%% Determine Second Order Approximation
% This program determines the goodness of fit (gof) for a second order
% underdamped system for damping rations from 0-1. 
%
%The results seem to be
% reasonable as of right now, but further adjustment of the settling time
% and starting value could yield better fits. 

function [array,exp_func, gof] = DecayFit(filtered_data)
    etta = 1;
    peak = filtered_data(1);
    ts = length(filtered_data);
    
    gof = [];
    ctr = 1;
	for etta = 0:0.001:1                                                                                                                                                                                   
        wn = 4/(etta*ts);
        A = peak;
        t = 1:1:ts;
        decay = A*exp(-etta*wn.*t).*cos(wn*sqrt(1 - etta^2).*t);

        gof(ctr) = goodnessOfFit(transpose(decay), filtered_data, 'NRMSE');
        ctr = ctr + 1;
    end
    
    [mag, idx] = max(gof);
    etta = idx*0.001;
    wn = 4/(etta*ts);
    A = peak;
    array = [etta, wn, A];
    exp_func = A*exp(-etta*wn.*t).*cos(wn*sqrt(1 - etta^2).*t);
end