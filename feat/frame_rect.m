function x = frame_rect(x, Nw, Ns)
% FRAME - sequence framing with rectangular window.
%
% Inputs:
%	x - input signal.
%	Nw - frame width (samples).
%	Ns - frame shift (samples).
%
% Outputs:
%	x - framed version of the input sequence.

%% FILE:           frame_rect.m 
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Sequence framing with rectangular window.
	x = buffer(x(:), Nw, Nw - Ns, 'nodelay')';
end