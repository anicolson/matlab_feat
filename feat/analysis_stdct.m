function x = analysis_stdct(x)
% ANALYSIS_STDCT - short-time discrete cosine transform of a signal for analysis.
%
% Inputs:
%	x.wav - input sequence.
%	x.N_d - frame duration (samples).
%	x.N_s - frame shift (samples).
%	x.NFFT - number of frequency bins.
%
% Outputs:
%	x.frm - framing & windowing.
%	x.STDCT - short-time discrete cosine transform.
%
%% FILE:           analysis_stdct.m
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes the short-time discrete cosine transform of a waveform for analysis.
x.frm = frame(x.wav, x.N_d, x.N_s); % framing & windowing.
x.STDCT = dct(x.frm, x.NFFT, 2); % short-time discrete cosine transform.
end
%% EOF
