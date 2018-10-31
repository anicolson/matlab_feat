function x = ssc_centered(x, H, bl, bh)
% SSC - centered Spectral Subband Centroids (SSC) of a sequence.
%
% Inputs:
%	x.wav - input sequence.
%	x.fs - sampling frequency of sequence.
%	x.Nw - frame width (samples).
%	x.Ns - frame shift (samples).
%	x.NFFT - number of frequency bins.
%	H - mel-filter banks.
%   bl - lower frequency of each filterbank.
%   bh - higher frequency of each filterbank.
%
% Outputs:
%	x.frm - framing & windowing.
%	x.STMS - single-sided Short-Time Magnitude Spectrum (STMS).
%	x.PSD - single-sided short-time Power Spectral Density (PSD).
%	x.SSC - centered Spectral Subband Centroids (SSC).

%% FILE:           ssc.m 
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes centered Spectral Subband Centroids (SSCs).
	x = psd(x); % single-sided short-time Power Spectral Density (PSD).
	f = linspace(0, x.fs/2, x.NFFT/2 + 1); % frequency bins (Hz), size 1xK.
	x.SSC = ((f.*x.PSD)*H')./(x.PSD*H'); % Spectral Suband Centroids (SSC).
	x.SSC = bsxfun(@rdivide, bsxfun(@minus, x.SSC, bl), bh - bl); % centering.
end