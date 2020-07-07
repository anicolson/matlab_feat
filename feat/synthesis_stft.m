function [x] = synthesis_stft(x, ams_type)
% SYNTHESIS_STFT - short-time Fourier transform analysis.
%
% Inputs:
%	x.STRS - short-time real spectrum.
%	x.STIS - short-time imaginary spectrum.
%   ams_type - 'rect'.
%
%   OR
%
%	x.STMS - short-time magnitude spectrum.
%	x.STPS - short-time phase spectrum.
%   ams_type - 'polar'.
%
%	x.N - signal length (samples).
%	x.N_d - frame duration (samples).
%	x.N_s - frame shift (samples).
%	x.NFFT - number of frequency bins.
%
% Outputs:
%	x.wav - reconstructed waveform.

%% FILE:           synthesis_stft.m
%% DATE:           2017
%% AUTHOR:         Aaron Nicolson
%% AFFILIATION:    Signal Processing Laboratory, Griffith University
%% BRIEF:          Computes waveform from short-time Fourier transform (synthesis).
if strcmp(ams_type, 'polar')
    x.STMS = [x.STMS, fliplr(x.STMS(:,2:end-1))]; % undo single-sided STMS.
    x.STFT = x.STMS.*exp(1i*x.STPS); % combine STMS & STPS to form STFT.
elseif strcmp(ams_type, 'rect')
    x.STRS = [x.STRS, fliplr(x.STRS(:,2:end-1))]; % undo single-sided STRS.
    x.STIS = [x.STIS, -fliplr(x.STIS(:,2:end-1))]; % undo single-sided STIS.
    x.STFT = complex(x.STRS, x.STIS); % combine STRS & STIS to form STFT.
end
x.wav = real(ifft(x.STFT, x.NFFT, 2)); % perform inverse STFT analysis (discard imaginary time domain components).
x.wav = x.wav(:, 1:x.N_d); % discard FFT padding from frames.
x.wav = least_squares_overlap_add(x.wav, x.N, x.N_d, x.N_s); % frame the input signal, and window each frame.
if any(isnan(x.wav(:)))
   error("Error: NaN in enhanced speech.") 
end
if any(isinf(x.wav(:)))
   error("Error: Inf in enhanced speech.") 
end
end
%% EOF
