%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: Elias Chokeir     %
% CLASS: Math 538         %
% ASSIGNMENT: Homework 6  %
% FILE: analyze_map.m     %
% DUE DATE: 10/16/25      %
% REDID: 825004915        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [a_values, lyapunov_exponents, bifurcation_points] = analyze_map( ...
        map_func, deriv_func, a_min, a_max, num_a_values, ...
        initial_x, num_transient, num_iterations)
% calculates lyapunov exponents and bifurcation points for a 1d map.

    % initialize arrays
    a_values = linspace(a_min, a_max, num_a_values); % parameter values
    lyapunov_exponents = zeros(1, num_a_values); % output array
    bifurcation_points = zeros(num_iterations, num_a_values); % output array

    fprintf('analyzing map for parameter a from %.2f to %.2f...\n', a_min, a_max);

    for i = 1:num_a_values
        current_a = a_values(i); % current parameter value
        x = initial_x; % reset starting point
        sum_ln_abs_f_prime = 0; % accumulator for lyapunov calculation

        % discard transient iterations
        for n = 1:num_transient
            x = map_func(x, current_a);
            if ~isfinite(x)
                 x = initial_x; % reset if divergent
            end
        end

        % calculate lyapunov exponent and collect bifurcation data
        for n = 1:num_iterations
            f_prime = deriv_func(x, current_a); % derivative at current point

            % handle zero or very small derivative
            if abs(f_prime) < eps 
                sum_ln_abs_f_prime = sum_ln_abs_f_prime + log(eps);
            else
                sum_ln_abs_f_prime = sum_ln_abs_f_prime + log(abs(f_prime));
            end

            x = map_func(x, current_a); % iterate map
            if ~isfinite(x)
                 x = initial_x; % reset if divergent
            end

            bifurcation_points(n, i) = x; % store point for bifurcation diagram
        end

        lyapunov_exponents(i) = sum_ln_abs_f_prime / num_iterations; % average
        
        % progress indicator
        if mod(i, floor(num_a_values/10)) == 0 || i == num_a_values
            fprintf('  processed %d/%d (%.1f%%) a values.\n', i, num_a_values, i/num_a_values*100);
        end
    end
    fprintf('analysis complete.\n');
end
