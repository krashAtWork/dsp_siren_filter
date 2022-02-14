%% reading the audio signal
[originalAudio, Fs] = audioread("E:\allData\fall_2020\dsp\finalExam\final401_2.wav");
n_audio_samples = length(originalAudio);


% Fs = 11035 Hz

% simple calculation :
% Length of audio in seconds = 62 s
% Fs = 11035 /s
% length of the vector = 11035* 62. = 684170

% length_audio =
% 
%       689937=> 62.522s


%% display the audio signal in time domain

final_t = n_audio_samples / Fs;
t = linspace(0,final_t, n_audio_samples); % time axis 62 seconds

length(t);
length(originalAudio);
figure('Name', "original");
plot(t, originalAudio)
title("audio signal in time domain")
xlabel("time")
ylabel("Amplitude"),

%% display the audio signal in frequency domain


originalAudio; Fs;
L = length(originalAudio);
dft_og = fft(originalAudio);
amplitude = abs(dft_og/ L);
% only first half to display
half_freq = amplitude(1:L/2 +1);
f = Fs*(0:(L/2))/L;

plot(f,half_freq);
title("audio signal in frequency domain - N point dft only first half")
xlabel("frequency in Hz")
ylabel("X(k)"),

% to remove 38060, what filter I must use.
%% applying a lowPass filter with cutoff 3000Hz

filtered_signal = filter(lowpass_3000,originalAudio );
filtered_signal_transform = fft(filtered_signal);
length_audio = length(filtered_signal);
number_samples = length(originalAudio)/Fs;
final_t = number_samples;
t = linspace(0,final_t, length_audio); % time axis 62 seconds
amplitude = abs(filtered_signal_transform/ L);
% only first half to display
half_freq = amplitude(1:L/2 +1);
f = Fs*(0:(L/2))/L;

% figure('Name','Modified  Audio');
% plot(t,filtered_signal)
% figure('Name','Modified  fft');
% plot(f, half_freq);




%% applying a filter test5 that removes 400 Hz and its harmonics
fs2 = filter(test5,filtered_signal );
filtered_signal_transform2 = fft(fs2);
length_audio = length(fs2);
number_samples = length(originalAudio)/Fs;
final_t = number_samples;
t = linspace(0,final_t, length_audio); % time axis 62 seconds
amplitude = abs(filtered_signal_transform2/ L);
% only first half to display
half_freq = amplitude(1:L/2 +1);
f = Fs*(0:(L/2))/L;

% figure('Name','Modified  Audio 2');
% plot(t,fs2)
% figure('Name','Modified  fft 2');
% plot(f, half_freq);

%% applying again test5 
%no improvements
fs3 = filter(test5,fs2 );
filtered_signal_transform3 = fft(fs3);
length_audio = length(fs3);
number_samples = length(originalAudio)/Fs;
final_t = number_samples;
t = linspace(0,final_t, length_audio); % time axis 62 seconds
amplitude = abs(filtered_signal_transform3/ L);
% only first half to display
half_freq = amplitude(1:L/2 +1);
f = Fs*(0:(L/2))/L;

% figure('Name','Modified  Audio 3');
% plot(t,fs3)
% figure('Name','Modified  fft 3');
% plot(f, half_freq);


%% applying again test5
fs4 = filter(test5,fs3);
filtered_signal_transform4 = fft(fs3);
length_audio = length(fs4);
number_samples = length(originalAudio)/Fs;
final_t = number_samples;
t = linspace(0,final_t, length_audio); % time axis 62 seconds
amplitude = abs(filtered_signal_transform4/ L);
% % only first half to display
half_freq = amplitude(1:L/2 +1);
f = Fs*(0:(L/2))/L;

% figure('Name','Modified  Audio 4');
% plot(t,fs4)
% figure('Name','Modified  fft 4');
% plot(f, half_freq);

%% applying a notch that removes 2002 Hz frequency
fs5 = filter(test6n1,fs4);
filtered_signal_transform5 = fft(fs4);
length_audio = length(fs4);
number_samples = length(originalAudio)/Fs;
final_t = number_samples;
t = linspace(0,final_t, length_audio); % time axis 62 seconds
amplitude = abs(filtered_signal_transform5/ L);
% % only first half to display
half_freq = amplitude(1:L/2 +1);
f = Fs*(0:(L/2))/L;

% figure('Name','Modified  Audio 5');
% plot(t,fs5)
% figure('Name','Modified  fft 5');
% plot(f, half_freq);


%% applying a notch that removes 2002 Hz frequency
fs6 = filter(test6n1,fs5);
filtered_signal_transform6 = fft(fs6);
length_audio = length(fs4);
number_samples = length(originalAudio)/Fs;
final_t = number_samples;
t = linspace(0,final_t, length_audio); % time axis 62 seconds
amplitude = abs(filtered_signal_transform6/ L);
% % only first half to display
half_freq = amplitude(1:L/2 +1);
f = Fs*(0:(L/2))/L;

figure('Name','Modified  Audio 6');
plot(t,fs6)
figure('Name','Modified  fft 6');
plot(f, half_freq);

 audiowrite("sol_final2.wav",fs6,Fs);
% 
% fs7 = filter(fnotch_1024m,fs6);
% filtered_signal_transform7 = fft(fs6);
% length_audio = length(fs7);
% number_samples = length(originalAudio)/Fs;
% final_t = number_samples;
% t = linspace(0,final_t, length_audio); % time axis 62 seconds
% amplitude = abs(filtered_signal_transform7/ L);
% % % only first half to display
% half_freq = amplitude(1:L/2 +1);
% f = Fs*(0:(L/2))/L;




% figure('Name','Modified  Audio 6');
% plot(t,fs7)
% figure('Name','Modified  fft 6');
% plot(f, half_freq);
% 
% audiowrite("sol_final2_1.wav",fs7,Fs);
%sound(fs6)

% 

% 
% 
% 
% sound(filtered_signal4);
% 
% function Hd = fnotch_1024m
% %FNOTCH _1024M Returns a discrete-time filter object.
% 
% % MATLAB Code
% % Generated by MATLAB(R) 9.7 and DSP System Toolbox 9.9.
% % Generated on: 16-Dec-2020 19:27:58
% 
% % IIR Notching filter designed using the IIRNOTCH function.
% 
% % All frequency values are in Hz.
% Fs = 11035;  % Sampling Frequency
% 
% Fnotch = 1025;  % Notch Frequency
% BW     = 1200;  % Bandwidth
% Apass  = 1;     % Bandwidth Attenuation
% 
% [b, a] = iirnotch(Fnotch/(Fs/2), BW/(Fs/2), Apass);
% Hd     = dfilt.df2(b, a);
% end

