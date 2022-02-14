function Hd = f1n800
%F1N800 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.7 and DSP System Toolbox 9.9.
% Generated on: 04-Dec-2020 21:47:04

% IIR Notching filter designed using the IIRNOTCH function.

% All frequency values are in Hz.
Fs = 11035;  % Sampling Frequency

Fnotch = 800;   % Notch Frequency
BW     = 1200;  % Bandwidth
Apass  = 1;     % Bandwidth Attenuation

[b, a] = iirnotch(Fnotch/(Fs/2), BW/(Fs/2), Apass);
Hd     = dfilt.df2(b, a);

% [EOF]