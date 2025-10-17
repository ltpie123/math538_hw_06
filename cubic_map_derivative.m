%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: Elias Chokeir           %
% CLASS: Math 538               %
% ASSIGNMENT: Homework 6        %
% FILE: cubic_map_derivative.m  %
% DUE DATE: 10/16/25            %
% REDID: 825004915              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function df_dx = cubic_map_derivative(x, a)
% computes the derivative of the cubic map: f(x) = a * x^3 + (1-a) * x
    df_dx = 3 * a * x^2 + (1 - a);
end
