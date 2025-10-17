%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: Elias Chokeir     %
% CLASS: Math 538         %
% ASSIGNMENT: Homework 6  %
% FILE: plot_results.m    %
% DUE DATE: 10/16/25      %
% REDID: 825004915        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_results(map_name, a_values, lyapunov_exponents, bifurcation_points, ...
                      a_min, a_max, lyapunov_ylim, bifurcation_ylim, ...
                      num_iterations, bifurcation_ytick_mode)
% plots lyapunov exponent and bifurcation diagram.

    % setup graphics toolkit
    try
        graphics_toolkit('qt'); % preferred toolkit
        use_qt = true;
    catch
        try
            graphics_toolkit('gnuplot'); % fallback option
            use_qt = false;
        catch
            graphics_toolkit('fltk'); % last resort
            use_qt = false;
        end
    end
    
    % create figure window
    try
        fig = figure('visible', 'off', 'units', 'inches', 'position', [1 1 8 10]);
    catch
        fig = figure('units', 'inches', 'position', [1 1 8 10]);
    end

    % plot lyapunov exponent
    subplot(2, 1, 1);
    plot(a_values, lyapunov_exponents, 'k.', 'markersize', 1); % data points
    hold on;
    plot(a_values, zeros(size(a_values)), 'k--'); % zero line
    hold off;
    title(sprintf('(a) lyapunov exponent of the %s', map_name), 'fontsize', 14);
    xlabel('parameter a', 'fontsize', 12);
    ylabel('\lambda', 'fontsize', 12);
    xlim([a_min a_max]); % set x-axis range
    ylim(lyapunov_ylim); % set y-axis range
    grid on;
    set(gca, 'fontsize', 10);

    % plot bifurcation diagram
    subplot(2, 1, 2);
    a_for_scatter = repelem(a_values, num_iterations); % repeat a values
    x_for_scatter = bifurcation_points(:); % flatten data
    finite_indices = isfinite(x_for_scatter); % remove inf/nan values
    scatter(a_for_scatter(finite_indices), x_for_scatter(finite_indices), 1, 'k', 'filled');

    title(sprintf('(b) bifurcation diagram of the %s', map_name), 'fontsize', 14);
    xlabel('parameter a', 'fontsize', 12);
    ylabel('x', 'fontsize', 12);
    xlim([a_min a_max]); % set x-axis range
    ylim(bifurcation_ylim); % set y-axis range
    grid on;
    if strcmp(bifurcation_ytick_mode, 'fixed')
        set(gca, 'ytick', 0:0.2:1); % fixed tick spacing
    else
        set(gca, 'ytickmode', 'auto'); % automatic spacing
    end
    set(gca, 'fontsize', 10);

    % add main title
    axes('Position', [0 0 1 1], 'Visible', 'off');
    text(0.5, 0.95, sprintf('lyapunov exponent and bifurcation diagram for the %s', map_name), ...
         'HorizontalAlignment', 'center', 'FontSize', 16, 'FontWeight', 'bold', ...
         'Units', 'normalized');

    % determine output filename
    if ~isempty(strfind(map_name, 'logistic'))
        filename = 'logistic_map_lyapunov_bifurcation.png';
    else
        filename = 'cubic_map_lyapunov_bifurcation.png';
    end
    
    % export figure with fallback options
    saved_successfully = false;
    
    % try png first
    try
        print(fig, filename, '-dpng', '-r300'); % high resolution
        fprintf('Saved figure as %s\n', filename);
        saved_successfully = true;
    catch err
        fprintf('Warning: Could not save figure as %s. Error: %s\n', filename, err.message);
    end
    
    % fallback to svg
    if ~saved_successfully
        try
            alt_filename = strrep(filename, '.png', '.svg');
            print(fig, alt_filename, '-dsvg');
            fprintf('Saved figure as %s instead\n', alt_filename);
            saved_successfully = true;
        catch err2
            fprintf('Warning: Could not save figure as %s. Error: %s\n', alt_filename, err2.message);
        end
    end
    
    % fallback to eps
    if ~saved_successfully
        try
            eps_filename = strrep(filename, '.png', '.eps');
            print(fig, eps_filename, '-deps');
            fprintf('Saved figure as %s instead\n', eps_filename);
            saved_successfully = true;
        catch err3
            fprintf('Warning: Could not save figure as %s. Error: %s\n', eps_filename, err3.message);
        end
    end
    
    if ~saved_successfully
        fprintf('Could not save figure in any format. Check your graphics toolkit installation.\n');
    end
    
    % cleanup
    close(fig);
end

