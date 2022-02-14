%% reading the audio signal
[originalAudio, Fs] = audioread("E:\allData\fall_2020\dsp\finalExam\report\f1\final401_1.wav"); 
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
%% design a filter that removes frequency at 800hz

f = Fs*(0:(L/2))/L;
correct = filter(f1n800,originalAudio );
filtered_signal_transform = fft(correct);


L = length(correct);
amplitude = abs(filtered_signal_transform/ L);

% only first half to display
half_freq = amplitude(1:L/2 +1);

length_audio = length(correct);
number_samples = length(originalAudio)/Fs;
final_t = number_samples;
t = linspace(0,final_t, length_audio); % time axis 62 seconds

figure('Name','Modified  Audio');

plot(t,correct)
title("Modified  Audio")
xlabel("time")
ylabel("amplitude"),
figure('Name','Modified  fft');

plot(f,half_freq);
title("Modified  fft")
xlabel("frequency")
ylabel("amplitude")

 sound(correct);
 audiowrite("sol_final1.wav",correct,Fs);



