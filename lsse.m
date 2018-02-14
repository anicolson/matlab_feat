function x = lsse(x, H)
% LSSE - log spectral subband energies of a signal.
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
%	x.MAG - magnitude spectrum.
%	x.PSD - power spectral density.
%	x.SSE - spectral suband energy.
%	x.LSSE - log spectral suband energy.

%% FILE:           lsse.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes Log Spectral Subband Energies.

x = psd(x); % compute power spectral density.
x.SSE = x.PSD*H'; % spectral suband energy.
x.LSSE = log(x.SSE); % log spectral suband energy.
end
%% EOF
