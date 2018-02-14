function x = psd(x)
% PSD - short-time power spectral density of a sequence.
%
% Inputs:
%	x.wav - input sequence.
%	x.fs - sampling frequency of sequence.
%	x.Nw - frame width (samples).
%	x.Ns - frame shift (samples).
%	x.NFFT - number of frequency bins.
%
% Outputs:
%	x.frm - framing & windowing.
%	x.MAG - single-sided short-time magnitude spectrum.
%	x.PSD - single-sided short-time power spectral density.

%% FILE:           psd.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes the Power Spectral Density (PSD) of a sequence.

% NOTE: all single-sided components are multiplied by 2 to conserve total power,
% except for the DC component (0) and the Nyquist frequency component (NFFT/2 + 1).

x = mag(x); % compute magnitude spectrum.
x.PSD = (1/(x.Nw*x.fs))*x.MAG.^2; % short-time power spectral density.
x.PSD(:, 2:end-1) = 2*x.PSD(:, 2:end-1); % single-sided short-time power spectral density.
end
%% EOF
