function snr_db = snr_db_level(s, d, snr)
% SNR_DB_LEVEL - calculates the SNR level (dB).
%
% Inputs:
%	s - clean speech.
%	d - background noise.
%
% Outputs:
%	snr_db - SNR level (dB).
%% FILE:           snr_db_level.m
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Calculates the SNR level (dB).
  snr_db = 10*log10(sum(s.^2)/sum((d).^2));
end
