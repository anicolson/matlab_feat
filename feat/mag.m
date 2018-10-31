function x = stms(x)
% STMS - computes the single-sided Short-Time Magnitude Spectrum (STMS) of a sequence.
%
% Inputs:
%	x.wav - input sequence.
%	x.Nw - frame width (samples).
%	x.Ns - frame shift (samples).
%	x.NFFT - number of frequency bins.
%
% Outputs:
%	x.frm - framing & windowing.
%	x.STMS - signle-sided Short-Time Magnitude Spectrum (STMS).

%% FILE:           stms.m 
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes the single-sided Short-Time Magnitude Spectrum (STMS) of a sequence.
	x.frm = frame(x.wav, x.Nw, x.Ns); % framing & windowing.
	x.STMS = abs(fft(x.frm, x.NFFT, 2)); % Short-Time Magnitude Spectrum (STMS).
	x.STMS = x.STMS(:,1:x.NFFT/2 + 1); % single-sided Short-Time Magnitude Spectrum (STMS).
end