%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: Elias Chokeir             %
% CLASS: Math 538                 %
% ASSIGNMENT: Homework 6          %
% FILE: logistic_map_derivative.m %
% DUE DATE: 10/16/25              %
% REDID: 825004915                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function df_dx = logistic_map_derivative(x, a)
% computes the derivative of the logistic map.
    df_dx = a * (1 - 2 * x);
end
