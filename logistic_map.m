%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: Elias Chokeir     %
% CLASS: Math 538         %
% ASSIGNMENT: Homework 6  %
% FILE: logistic_map.m    %
% DUE DATE: 10/16/25      %
% REDID: 825004915        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x_next = logistic_map(x, a)
% computes one iteration of the logistic map.
    x_next = a * x * (1 - x);
end
