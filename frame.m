function x = frame(x, Nw, Ns)
% FRAME - signal framing and windowing (Hamming window).
%
% Inputs:
%	x - input signal.
%	Nw - frame width (samples).
%	Ns - frame shift (samples).
%
% Outputs:
%	x - framed and windowed version of the input signal.

%% FILE:           frame.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Signal framing and windowing (Hamming window).
x = bsxfun(@times, buffer(x(:), Nw, Nw - Ns, 'nodelay'), hamming(Nw))';
end
%% EOF
