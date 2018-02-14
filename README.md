# matlab_feat
##### Digital Signal Processing (DSP) functions for creating Automatic Speech Recognition (ASR) features in MATLAB.

## MFCC Example:

*%% SINGLE-CHANNEL SEQUENCE PATH* <br />
seq_path = 'path_to_sequence'; *% path to the location of the audio sequence.* <br /> <br />

*%% PARAMETERS* <br />
Tw = 32 *% window length (ms).* <br />
Ts = 16 *% window shift (ms).* <br />
x.Nw = round(fs*Tw*0.001); *% window length (samples).* <br />
x.Ns = round(fs*Ts*0.001); *% window shift (samples).* <br />
x.fs = 16000; *% sampling frequency (Hz).* <br />
x.NFFT = 2^nextpow2(x.Nw); *% frequency bins (samples).* <br /> <br />

*%% SINGLE-CHANNEL SEQUENCE* <br />
[x.wav, ~] = audioread(seq_path); *% waveform.* <br /> <br />

*%% FILTER BANK* <br />
H = melfbank(26, x.NFFT/2 + 1, fs); *% mel filter banks.* <br /> <br />

%% MFCCs <br />
x = mfcc(x, H); *% compute Mel Frequency Cepstral Coefficients (MFCC).* <br /> <br />

*% x.MFCC will give the feature matrix.* <br />
