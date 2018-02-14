function x = frame_rect(x, Nw, Ns)
% FRAME - sequence framing.
%
% Inputs:
%	x - input signal.
%	Nw - frame width (samples).
%	Ns - frame shift (samples).
%
% Outputs:
%	x - framed version of the input sequence.

%% FILE:           frame_rect.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Sequence framing.
x = buffer(x(:), Nw, Nw - Ns, 'nodelay');
end
%% EOF
