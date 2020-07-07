function [x, d] = add_noise(s, d, snr)
% ADD_NOISE - Add noise to clean speech at specified SNR level.
%
% Inputs:
%	s - clean speech.
%	d - background noise.
%	snr - SNR level (dB).
%
% Outputs:
%	x - resultant noisy speech.
% d - a random, scaled section of the input noise.
%% FILE:           add_noise.m
%% DATE:           2018
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Add noise to clean speech at specified SNR level.

  s_len = length(s);
  d_len = length(d);
  snr = 10.0^(snr/10); % inverse of dB.
  i = randi(1 + d_len - s_len);
  d = d(i:i + s_len - 1);
  P_s = mean(s.^2); % average power of clean speech.
  P_d = mean(d.^2); % average power of noise.
  alpha = sqrt(P_s./max(P_d*snr, 1e-12)); % scaling factor.
  d =	d*alpha;
  x = s + d;
end
