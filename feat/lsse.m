function x = lsse(x, H)
% LSSE - Log-Spectral Suband Energies (LSSE) of a sequence.
%
% Inputs:
%	x.wav - input sequence.
%	x.fs - sampling frequency of sequence.
%	x.Nw - frame width (samples).
%	x.Ns - frame shift (samples).
%	x.NFFT - number of frequency bins.
%	H - mel-filter banks.
%
% Outputs:
%	x.frm - framing & windowing.
%	x.MAG - single-sided Short-Time Magnitude Spectrum (STMS).
%	x.PSD - single-sided short-time Power Spectral Density (PSD).
%	x.SSE - Spectral Suband Energies (SSE).
%	x.LSSE - Log-Spectral Suband Energies (LSSE).

%% FILE:           lsse.m 
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes the Log-Spectral Suband Energies (LSSE) of a sequence.
	x = psd(x); % compute single-sided short-time Power Spectral Density (PSD).
	x.SSE = x.PSD*H'; % Spectral Suband Energies (SSE).
	x.LSSE = log(x.SSE); % Log-Spectral Suband Energies (LSSE).
end