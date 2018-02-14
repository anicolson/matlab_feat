function c = lifter(c, L)
% LIFTER - cepstra liftering.
%
% Inputs:
%	c - cepstra coefficients.
%	L - dimensionality of the cepstra.
%
% Outputs:
%	c - liftered cepstra coefficients.

%% FILE:           lifter.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Cepstra liftering.

    [N, D] = size(c); % no. of frames, and dimensions.
    n = 0:D-1; 
    lifter = 1 + (L/2)*sin(pi*n/L); % lifter.
    c = c.*repmat(lifter, N, 1); % liftering.
end
%% EOF
