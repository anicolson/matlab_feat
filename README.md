# matlab_feat
Digital Signal Processing (DSP) functions for creating Automatic Speech Recognition (ASR) features in MATLAB.

%% SINGLE-CHANNEL SEQUENCE PATH
seq_path = 'path_to_sequence'; % path to the location of the audio sequence.

%% PARAMETERS
Tw = 32 % window length (ms).
Ts = 16 % window shift (ms).
x.Nw = round(fs*Tw*0.001); % window length (samples).
x.Ns = round(fs*Ts*0.001); % window shift (samples).
x.fs = 16000; % sampling frequency (Hz).
x.NFFT = 2^nextpow2(x.Nw); % frequency bins (samples).

%% SINGLE-CHANNEL SEQUENCE
[x.wav, ~] = audioread(seq_path); % waveform.

%% FILTER BANK
H = melfbank(26, x.NFFT/2 + 1, fs); % mel filter banks.

%% MFCCs
x = mfcc(x, H); % compute Mel Frequency Cepstral Coefficients (MFCC).

% x.MFCC will give the feature matrix.
