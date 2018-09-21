%% Exponential Fitting Algorithm
% By Tylor Slay
% Portland State University

%% READ IN DATA FROM FILE
% There are multiple input files that must be processed. I wrote a function
% to read in the file and pass the values so that I can do it within a loop
% later.

% I put all of the function files for this program within the following
% directory. This will need to be modified to your specific directory.
addpath('N:\My Documents\MATLAB\Exponential_Fit\functions');
close all
clear
clc

for ii = 1:9
    filename = ['rocof_' num2str(ii) '.csv'];
    data = ReadData(filename);
    filtered_data = FilterData(data(:,2));
    
    [start_t, stop_t, set_t] = SettlingTime(filtered_data);
    data_window = filtered_data(start_t:stop_t);
    [array, exp_func, gof] = DecayFit(data_window);
    
    for jj = 1:length(array)
       tab{ii,jj} = array(jj); 
    end
    
    figure
    subplot(1,2,1);
    hold on
    plot(data(start_t:stop_t,2))
    plot(exp_func)
    hold off
    
    subplot(1,2,2);
    hold on
    plot(data(:,2))
    plot(filtered_data)
    hold off
end

names = ['etta', 'Wn', 'A'];
T = array2table(tab);
T.Properties.VariableNames = {'etta', 'Wn', 'A'};
disp(T);

