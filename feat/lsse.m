function x = lsse(x, H)
% LSSE - log spectral subband energies of a sequence.
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
%	x.MAG - single-sided short-time magnitude spectrum.
%	x.PSD - single-sided short-time power spectral density.
%	x.SSE - spectral suband energies.
%	x.LSSE - log spectral suband energies.

%% FILE:           lsse.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes the Log Spectral Subband Energies (LSSE) of a sequence.

x = psd(x); % compute single-sided short-time power spectral density.
x.SSE = x.PSD*H'; % spectral suband energies.
x.LSSE = log(x.SSE); % log spectral suband energies.
end
%% EOF
