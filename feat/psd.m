function x = psd(x)
% PSD - short-time Power Spectral Density (PSD) of a sequence.
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
%	x.MAG - single-sided Short-Time Magnitude Spectrum (STMS).
%	x.PSD - single-sided short-time Power Spectral Density (PSD).

%% FILE:           psd.m 
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes the Power Spectral Density (PSD) of a sequence.

% NOTE: all single-sided components are multiplied by 2 to conserve total power,
% except for the DC component (0) and the Nyquist frequency component (NFFT/2 + 1).
	x = mag(x); % single-sided Short-Time Magnitude Spectrum (STMS).
	x.PSD = (1/(x.Nw*x.fs))*x.STMS.^2; % single-sided short-time Power Spectral Density (PSD).
	x.PSD(:, 2:end-1) = 2*x.PSD(:, 2:end-1); % single-sided short-time Power Spectral Density (PSD).
end
%% EOF
