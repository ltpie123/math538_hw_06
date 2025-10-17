%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: Elias Chokeir     %
% CLASS: Math 538         %
% ASSIGNMENT: Homework 6  %
% FILE: cubic_map.m       %
% DUE DATE: 10/16/25      %
% REDID: 825004915        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x_next = cubic_map(x, a)
% computes one iteration of the cubic map: f(x) = a * x^3 + (1-a) * x
    x_next = a * x^3 + (1 - a) * x;
end
