function x = mfcc(x, H)
% MFCC - Mel-Frequency Cepstral Coefficients (MFCC) of a sequence.
%
% Inputs:
%	x.wav - input sequence.
%	x.fs - sampling frequency of signal.
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
%	x.MFCC - Mel Frequency Cepstral Coefficients (MFCC).

%% FILE:           mfcc.m 
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes Mel-Frequency Cepstral Coefficients (MFCC).
	x = lsse(x, H); % compute Log-Spectral Suband Energies (LSSE).
	x.MFCC = lifter(dct(x.LSSE, [], 2), 22); % liftered Mel-Frequency Cepstral Coefficients (MFCC).
end