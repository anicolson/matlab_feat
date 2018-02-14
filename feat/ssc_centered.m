function x = ssc_centered(x, H, bl, bh)
% SSC - centered spectral subband centroids of a sequence.
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
%	x.MAG - single-sided short-time magnitude spectrum.
%	x.PSD - single-sided short-time power spectral density.
%	x.SSC - spectral subband centroids.

%% FILE:           ssc.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes centered Spectral Subband Centroids (SSCs).

x = psd(x); % single-sided short-time power spectral density.
f = linspace(0, x.fs/2, x.NFFT/2 + 1); % frequency bins (Hz), size 1xK.
x.SSC = ((f.*x.PSD)*H')./(x.PSD*H'); % spectral suband centroids.
x.SSC = bsxfun(@rdivide, bsxfun(@minus, x.SSC, bl), bh - bl); % centering.
end
%% EOF
