%% reading the audio signal
[oa3, Fs] = audioread("E:\allData\fall_2020\dsp\finalExam\final401_3.wav");
n_audio_samples = length(oa3);
global Fs


% Fs = 11035 Hz

% simple calculation :
% Length of audio in seconds = 62 s
% Fs = 11035 /s
% length of the vector = 11035* 62. = 684170

% n 1 sec how many samples come : 684170 :62s so in 1 secone
batch1 = 684170*10/62;

% length_audio =
% 
%       689937=> 62.522s
%% display only the first 11035 samples.
final_t = batch1 / Fs;
batch1_sig = oa3(1:batch1,1);
t = linspace(0,final_t, batch1); % time axis 62 seconds
% sound(batch1_sig);
length(t);
length(oa3);
figure('Name', "original");
plot(t, batch1_sig)
title("audio signal in time domain")
xlabel("time")
ylabel("Amplitude")
%% 
oa3; Fs;
L = length(batch1_sig);
dft_batch1 = fft(batch1_sig);
amplitude = abs(dft_batch1/ L);
% only first half to display
half_freq = amplitude(1:L/2 +1);
f = Fs*(0:(L/2))/L;

plot(f,half_freq);
title("audio signal in frequency domain - N point dft only first half")
xlabel("frequency in Hz")
ylabel("X(k)")
%% bandpass
b1fs1 = plotfft(f3bp1,batch1_sig );
b1fs2 = plotfft(f3bp22,b1fs1);
b1fs3 = plotfft(f3bp3,b1fs2);
% audiowrite("break1.wav",b1fs2,Fs);

%% second signal
batch2_sig = oa3(batch1:2*batch1,1);
b2fs1 = plotfft(f3bp1,batch2_sig );
b2fs2 = plotfft(f3bp22,b2fs1);
b2fs3 = plotfft(f3bp3,b2fs2 );

%% third signal
batch3_sig = oa3(2*batch1:3*batch1,1);
b3fs1 = plotfft(f3bp1,batch3_sig );
b3fs2 = plotfft(f3bp22,b3fs1);
b3fs3 = plotfft(f3bp3,b3fs2 );

%% fourth signal
batch4_sig = oa3(3*batch1:4*batch1,1);
b4fs1 = plotfft(f3bp1,batch4_sig );
b4fs2 = plotfft(f3bp22,b4fs1);
b4fs3 = plotfft(f3bp3,b4fs2 );

%% fifth signal
batch5_sig = oa3(4*batch1:5*batch1,1);
b5fs1 = plotfft(f3bp1,batch5_sig );
b5fs2 = plotfft(f3bp22,b5fs1);
b5fs3 = plotfft(f3bp3,b5fs2 );
%% sixth signal
batch6_sig = oa3(5*batch1:6*batch1,1);
% b3fs1 = plotfft(f3bp1,batch3_sig );
% b3fs2 = plotfft(f3bp22,b3fs1);
% b3fs3 = plotfft(f32000,b3fs2 );
% 



final = [b1fs3 ; b2fs3;
     b3fs3; b4fs3; b5fs3; batch6_sig
    ]; 
% sound(final);
audiowrite("sol_final3.wav",final,Fs);




% filtered_signal_transform = fft(fs1);
% length_audio = length(fs1);
% number_samples = length(batch1_sig)/Fs;
% final_t = number_samples;
% t = linspace(0,final_t, length_audio); % time axis 62 seconds
% amplitude = abs(filtered_signal_transform/ L);
% % only first half to display
% half_freq = amplitude(1:L/2 +1);
% f = Fs*(0:(L/2))/L;
% 
% figure('Name','Modified  Audio');
% plot(t,fs1)
% figure('Name','Modified  fft');
% plot(f, half_freq);

% sound(fs1);

%% display the audio signal in time domain
% sound(oa3);
% final_t = n_audio_samples / Fs;
% t = linspace(0,final_t, n_audio_samples); % time axis 62 seconds
% 
% length(t);
% length(oa3);
% figure('Name', "original");
% plot(t, oa3)
% title("audio signal in time domain")
% xlabel("time")
% ylabel("Amplitude"),

%% display the audio signal in frequency domain


% oa3; Fs;
% L = length(oa3);
% dft_og = fft(oa3);
% amplitude = abs(dft_og/ L);
% % only first half to display
% half_freq = amplitude(1:L/2 +1);
% f = Fs*(0:(L/2))/L;
% 
% plot(f,half_freq);
% title("audio signal in frequency domain - N point dft only first half")
% xlabel("frequency in Hz")
% ylabel("X(k)"),


%% notch out 608
% 
% 
% fs1 = filter(f3bp1,oa3 );
% filtered_signal_transform = fft(fs1);
% length_audio = length(fs1);
% number_samples = length(oa3)/Fs;
% final_t = number_samples;
% t = linspace(0,final_t, length_audio); % time axis 62 seconds
% amplitude = abs(filtered_signal_transform/ L);
% % only first half to display
% half_freq = amplitude(1:L/2 +1);
% f = Fs*(0:(L/2))/L;
% 
% figure('Name','Modified  Audio');
% plot(t,fs1)
% figure('Name','Modified  fft');
% plot(f, half_freq);

%sound(fs1);


%% high pass and remove the sound completely along with signal
% fs2 = filter(f3bp3,fs1 );
% filtered_signal_transform2 = fft(fs2);
% length_audio = length(fs2);
% number_samples = length(fs2)/Fs;
% final_t = number_samples;
% t = linspace(0,final_t, length_audio); % time axis 62 seconds
% amplitude = abs(filtered_signal_transform2/ L);
% % only first half to display
% half_freq = amplitude(1:L/2 +1);
% f = Fs*(0:(L/2))/L;
% 
% figure('Name','Modified  Audio');
% plot(t,fs2)
% figure('Name','Modified  fft');
% plot(f, half_freq);
% 
% audiowrite("sol_final3.wav",fs2,Fs);

%% 
function outSig = plotfft(fltr, inpSig)
global Fs
    outSig = filter(fltr,inpSig );
    filtered_signal_transform = fft(outSig);
    length_audio = length(outSig);
    number_samples = length(outSig)/Fs;
    final_t = number_samples;
    t = linspace(0,final_t, length_audio); % time axis 62 seconds
    amplitude = abs(filtered_signal_transform/ length_audio);
% only first half to display
    half_freq = amplitude(1:length_audio/2 +1);
    f = Fs*(0:(length_audio/2))/length_audio;

%     figure('Name','Modified  Audio');
%     plot(t,outSig)
%     figure('Name','Modified  fft');
%     plot(f, half_freq);
end