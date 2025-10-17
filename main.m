%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: Elias Chokeir     %
% CLASS: Math 538         %
% ASSIGNMENT: Homework 6  %
% FILE: main.m            %
% DUE DATE: 10/16/25      %
% REDID: 825004915        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% analyzes and plots lyapunov exponents and bifurcation diagrams for 1d maps.

clear;
clc;
close all; % close all open figures

% simulation parameters
num_a_values = 1000; % number of parameter values to test
num_transient = 500; % transient iterations to discard
num_iterations = 500; % iterations for lyapunov calculation

% automatically run both maps
fprintf('running analysis for both logistic and cubic maps...\n');
choice = 3;

% main analysis logic
if choice == 1 || choice == 3 % analyze logistic map
    try
        fprintf('\n--- analyzing logistic map ---\n');

        % logistic map parameters
        map_name = 'logistic map';
        map_func = @logistic_map; % function handle
        deriv_func = @logistic_map_derivative; % derivative handle
        a_min = 2.0; % parameter range start
        a_max = 4.0; % parameter range end
        initial_x = 0.5; % starting point
        lyapunov_ylim = [-1.5 1.0]; % y-axis limits for lyapunov plot
        bifurcation_ylim = [0 1]; % y-axis limits for bifurcation plot
        bifurcation_ytick_mode = 'fixed'; % fixed tick spacing

        % run analysis
        [a_values, lyapunov_exponents, bifurcation_points] = analyze_map( ...
            map_func, deriv_func, a_min, a_max, num_a_values, ...
            initial_x, num_transient, num_iterations);

        % generate plots and export
        plot_results(map_name, a_values, lyapunov_exponents, bifurcation_points, ...
                     a_min, a_max, lyapunov_ylim, bifurcation_ylim, ...
                     num_iterations, bifurcation_ytick_mode);

        fprintf('Logistic map analysis completed successfully.\n');
    catch err
        fprintf('Error in logistic map analysis: %s\n', err.message);
    end

    % Continue to cubic map without pause for automatic execution
end

if choice == 2 || choice == 3 % analyze cubic map
    try
        fprintf('\n--- analyzing cubic map ---\n');

        % cubic map parameters
        map_name = 'cubic map: f(x) = a*x^3 + (1-a)*x';
        map_func = @cubic_map; % function handle
        deriv_func = @cubic_map_derivative; % derivative handle
        a_min = 2.0; % parameter range start
        a_max = 4.0; % parameter range end
        initial_x = 0.5; % starting point
        lyapunov_ylim = [-1.5 5.0]; % y-axis limits for lyapunov plot
        bifurcation_ylim = [-2 2]; % y-axis limits for bifurcation plot
        bifurcation_ytick_mode = 'auto'; % automatic tick spacing

        % run analysis
        [a_values, lyapunov_exponents, bifurcation_points] = analyze_map( ...
            map_func, deriv_func, a_min, a_max, num_a_values, ...
            initial_x, num_transient, num_iterations);

        % generate plots and export
        plot_results(map_name, a_values, lyapunov_exponents, bifurcation_points, ...
                     a_min, a_max, lyapunov_ylim, bifurcation_ylim, ...
                     num_iterations, bifurcation_ytick_mode);

        fprintf('Cubic map analysis completed successfully.\n');
    catch err
        fprintf('Error in cubic map analysis: %s\n', err.message);
    end
end

fprintf('\nall selected analysis complete.\n');
