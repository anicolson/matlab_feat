function y = overlap_add(x, N, Nw, Ns)
% OVERLAP_ADD - reconstruct waveform using overlap add.
%
% Inputs:
%	x - framed synthesised signal.
%   N - signal length (samples).
%   Nw - frame width (samples).
%   Ns - frame shift (samples).
%
% Outputs:
%	y - reconstructed waveform.

%% FILE:           overlap_add.m
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Reconstruct synthesized signal from frames using overlap-add method.

    w = hamming(Nw)'; % hamming window function.
	M = size(x, 1); % number of frames.
    i_f = (Ns*(0:(M-1)))'; % frame index.
    i_s = 1:Nw; % sample index in each frame.
    i = i_f(:,ones(1,Nw)) + i_s(ones(M,1),:); % absolute sample index for each frame.
    y = zeros(1, (M-1)*Ns + Nw);
    w_sum = zeros(1, (M-1)*Ns + Nw); 
    for j = 1:M
        y(i(j,:)) = y(i(j,:)) + x(j,:); % overlap-add processed frames.
        w_sum(i(j,:)) = w_sum(i(j,:)) + w; % overlap-add window samples.
    end
    y = (y./w_sum)'; % remove windowing.
    y = y(1:N); % remove padding.
end
