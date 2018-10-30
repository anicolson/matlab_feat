# matlab_feat
##### Digital Signal Processing (DSP) functions for creating Automatic Speech Recognition (ASR) features in MATLAB. Features included:

Feature | Description
--------| -----------
 STMS | Short-Time Magnitude Spectrum
 PSD | Power Spectral Density
 MFCC | Mel-Frequency Cepstral Coefficients
 LSSE | Log-Spectral Subband Energies
 SSC | Spectral Subband Centroids

##### Note: LSSEs are equivalent to Log Filter Bank Energies (LFBE).


## References
[1] [Nicolson, A., Hanson, J., Lyons, J. and Paliwal, K., 2018. Spectral Subband Centroids for Robust Speaker Identification using Marginalization-based Missing Feature Theory. International Journal of Signal Processing Systems, 6(1), pp.12-16.](https://maxwell.ict.griffith.edu.au/spl/publications/papers/icsps17_aaron.pdf)

## MFCC Example:

*%% SINGLE-CHANNEL SEQUENCE PATH* <br />
seq_path = 'path_to_sequence'; *% path to the location of the audio sequence.* <br /> <br />

*%% PARAMETERS* <br />
x.fs = 16000; *% sampling frequency (Hz).* <br />
x.Nw = 512; *% window length (samples). This is for a 32 ms window.* <br />
x.Ns = 256; *% window shift (samples). This is for a 16 ms shift.* <br />
x.NFFT = 2^nextpow2(x.Nw); *% frequency bins (samples).* <br /> <br />

*%% SINGLE-CHANNEL SEQUENCE* <br />
[x.wav, ~] = audioread(seq_path); *% waveform.* <br /> <br />

*%% MEL-SCALED FILTER BANK* <br />
H = melfbank(26, x.NFFT/2 + 1, fs); *% mel filter banks.* <br /> <br />

*%% MFCC* <br />
x = mfcc(x, H); *% compute Mel Frequency Cepstral Coefficients (MFCC).* <br /> <br />

##### The elements of struct 'x' include:

*x.frm - framed & windowed sequence.* <br />
*x.STMS - single-sided short-time magnitude spectrum.* <br />
*x.PSD - single-sided short-time power spectral density.* <br />
*x.SSE - spectral suband energies.* <br />
*x.LSSE - log-spectral suband energies.* <br />
*x.MFCC - mel-frequency cepstral coefficients.* <br />
