function x = mfcc(x, H)
% MFCC - mel frequency cepstral coefficients of a sequence.
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
%	x.MAG - single-sided short-time magnitude spectrum.
%	x.PSD - single-sided short-time power spectral density.
%	x.SSE - spectral suband energies.
%	x.LSSE - log spectral suband energies.
%	x.MFCC - mel frequency cepstral coefficients.

%% FILE:           mfcc.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes Mel-Frequency Cepstral Coefficients.

x = lsse(x, H); % compute log spectral subband energies.
x.MFCC = lifter(dct(x.LSSE, [], 2), 22); % liftered MFCCs.
end
%% EOF
