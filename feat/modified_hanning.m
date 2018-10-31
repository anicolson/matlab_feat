function w = modified_hanning(N_l)
% MODIFIED_HANNING - modified Hanning window function.
%
% Input/s:
%	N_l - frame length (discrete-time samples).
%
% Output/s:
%	w - modified Hanning window of length N_l.

%% FILE:           mod_hanning.m 
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Modified Hanning window function.
	w = 0.5 - 0.5*cos((2*pi*(1:N_l + 0.5))/N_l); % modified Hanning window function.
end
