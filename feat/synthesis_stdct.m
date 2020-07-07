function [x] = synthesis_stdct(x)
% SYNTHESIS_STDCT - short-time discrete cosine transform analysis.
%
% Inputs:
%	x.STDCT - short-time discrete cosine transform.
%	x.N - signal length (samples).
%	x.N_d - frame duration (samples).
%	x.N_s - frame shift (samples).
%	x.NFFT - number of frequency bins.
%
% Outputs:
%	x.wav - reconstructed waveform.

%% FILE:           synthesis_stdct.m
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes waveform from short-time discrete cosine transform (synthesis).
x.wav = idct(x.STDCT, x.NFFT, 2); % perform inverse STDCT analysis.
x.wav = x.wav(:, 1:x.N_d); % discard padding from frames.
x.wav = least_squares_overlap_add(x.wav, x.N, x.N_d, x.N_s); % frame the input signal, and window each frame.
end
%% EOF
