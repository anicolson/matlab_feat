function x = analysis_stft(x, ams_type)
% ANALYSIS_STFT - short-time Fourier transform of a signal for analysis.
%
% Inputs:
%	x.wav - input sequence.
%	x.N_d - frame duration (samples).
%	x.N_s - frame shift (samples).
%	x.NFFT - number of frequency bins.
%	ams_type - AMS framework type (e.g. polar).
%
% Outputs:
%	x.frm - framing & windowing.
%	x.STFT - short-time Fourier transform.
%	x.STMS - short-time magnitude spectrum.
%	x.STPS - short-time phase spectrum.
%	x.STRS - short-time real spectrum.
%	x.STIS - short-time imaginary spectrum.
%
%% FILE:           analysis_stft.m
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes the short-time Fourier transform of a waveform for analysis.
x.frm = frame(x.wav, x.N_d, x.N_s); % framing & windowing.
x.STFT = fft(x.frm, x.NFFT, 2); % short-time Fourier transform.
if strcmp(ams_type, 'polar')
  %% FOR STMS AND STPS:
  % components 0 and NFFT/2 are unique.
  % componets 1 to NFFT/2 - 1 and NFFT/2 + 1 to NFFT are mirrored.
  x.STMS = abs(x.STFT); % short-time magnitude spectrum (STMS).
  x.STMS = x.STMS(:,1:x.NFFT/2 + 1); % single-sided STMS.
  x.STPS = angle(x.STFT); % short-time phase spectrum.
elseif strcmp(ams_type, 'rect')
  %% FOR STMS AND STPS:
  % components 0 and NFFT/2 are unique.
  % componets 1 to NFFT/2 - 1 and NFFT/2 + 1 to NFFT are negatively mirrored.
  x.STRS = real(x.STFT); % short-time real spectrum (STRS).
  x.STRS = x.STRS(:,1:x.NFFT/2 + 1); % single-sided STRS.
  x.STIS = imag(x.STFT); % short-time imaginary spectrum (STIS).
  x.STIS = x.STIS(:,1:x.NFFT/2 + 1); % single-sided STIS.
end
end
%% EOF
