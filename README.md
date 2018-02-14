# matlab_feat
##### Digital Signal Processing (DSP) functions for creating Automatic Speech Recognition (ASR) features in MATLAB.

## MFCC Example:

*%% SINGLE-CHANNEL SEQUENCE PATH* <br />
seq_path = 'path_to_sequence'; *% path to the location of the audio sequence.* <br /> <br />

*%% PARAMETERS* <br />
x.fs = 16000; *% sampling frequency (Hz).* <br />
x.Nw = 512; *% window length (samples). This is for a 32 ms window.* <br />
x.Ns = 256; *% window shift (samples). This is for a 16 ms shift* <br />
x.NFFT = 2^nextpow2(x.Nw); *% frequency bins (samples).* <br /> <br />

*%% SINGLE-CHANNEL SEQUENCE* <br />
[x.wav, ~] = audioread(seq_path); *% waveform.* <br /> <br />

*%% FILTER BANK* <br />
H = melfbank(26, x.NFFT/2 + 1, fs); *% mel filter banks.* <br /> <br />

%% MFCCs <br />
x = mfcc(x, H); *% compute Mel Frequency Cepstral Coefficients (MFCC).* <br /> <br />

*% x.MFCC will give the feature matrix.* <br />
