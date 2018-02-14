function x = mag(x)
% MAG - magnitude spectrum of a signal.
%
% Inputs:
%	x.wav - input sequence.
%	x.Nw - frame width (samples).
%	x.Ns - frame shift (samples).
%	x.NFFT - number of frequency bins.
%
% Outputs:
%	x.frm - framing & windowing.
%	x.MAG - magnitude spectrum.

%% FILE:           mag.m 
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes the magnitude spectrum of a waveform.

x.frm = frame(x.wav, x.Nw, x.Ns); % framing & windowing.
x.MAG = abs(fft(x.frm, x.NFFT, 2)); % magnitude spectrum.
x.MAG = x.MAG(:,1:x.NFFT/2 + 1); % single-sided magnitude spectrum.
end
%% EOF
