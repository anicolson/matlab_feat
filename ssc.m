function x = ssc(x, H, bl, bh)
% SSC - spectral subband centroids of a signal.
%
% Inputs:
%	x.wav - input sequence.
%	x.fs - sampling frequency of signal.
%	x.Nw - frame width (samples).
%	x.Ns - frame shift (samples).
%	x.NFFT - number of frequency bins.
%	H - mel-filter banks.
%   bl - lower frequency of each filterbank.
%   bh - higher frequency of each filterbank.
%
% Outputs:
%	x.frm - framing & windowing.
%	x.MAG - magnitude spectrum.
%	x.PSD - power spectral density.
%	x.SSC - spectral subband centroids.

%% FILE:           ssc.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes Spectral Subband Centroids.

x = psd(x); % power spectral density.
f = linspace(0, x.fs/2, x.NFFT/2 + 1); % frequency bins (Hz), size 1xK.
x.SSC = ((f.*x.PSD)*H')./(x.PSD*H'); % spectral suband centroids.
x.SSC = bsxfun(@rdivide, bsxfun(@minus, x.SSC, bl), bh - bl);
end
%% EOF
