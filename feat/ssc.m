function x = ssc(x, H)
% SSC - Spectral Subband Centroids (SSC) of a sequence.
%
% Inputs:
%	x.wav - input sequence.
%	x.fs - sampling frequency of sequence.
%	x.Nw - frame width (samples).
%	x.Ns - frame shift (samples).
%	x.NFFT - number of frequency bins.
%	H - mel-scale filter bank.
%
% Outputs:
%	x.frm - framing & windowing.
%	x.STMS - single-sided Short-Time Magnitude Spectrum (STMS).
%	x.PSD - single-sided short-time Power Spectral Density (PSD).
%	x.SSC - Spectral Subband Centroids (SSC).

%% FILE:           ssc.m 
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes Spectral Subband Centroids (SSCs).
	x = psd(x); % single-sided short-time Power Spectral Density (PSD)
	f = linspace(0, x.fs/2, x.NFFT/2 + 1); % frequency bins (Hz), size 1xK.
	x.SSC = ((f.*x.PSD)*H')./(x.PSD*H'); % Spectral Subband Centroids (SSC).
end