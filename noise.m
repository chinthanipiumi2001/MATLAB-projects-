% Generate a signal with noise
Fs = 1000; % Sampling frequency
t = 0:1/Fs:1; % Time vector
f1 = 50; % Frequency of the signal
signal = 2*sin(2*pi*f1*t) + 0.5*sin(2*pi*150*t); % Signal with noise (50 Hz and 150 Hz components)
Noise = 0.5*randn(size(t)); % Add random noise
signal_with_noise = signal + Noise; % Signal with added noise

% Perform Fourier Transform
n = length(signal_with_noise);
f_signal = fft(signal_with_noise);

% Create frequency axis
f_axis = Fs*(0:(n/2))/n;

% Plot original signal with noise in time domain
figure;
subplot(2, 1, 1);
plot(t, signal_with_noise);
title('Signal with Noise (Time Domain)');
xlabel('Time');
ylabel('Amplitude');

% Plot signal with noise in frequency domain
subplot(2, 1, 2);
plot(f_axis, abs(f_signal(1:n/2+1)));
title('Signal with Noise (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% Filter out noise in the frequency domain
% Assuming you want to filter out the 150 Hz noise component
f_signal_clean = f_signal;
f_signal_clean(f_axis > 140 & f_axis < 160) = 0; % Filter out frequencies around 150 Hz

% Transform back to time domain
signal_clean = ifft(f_signal_clean);

% Plot cleaned signal in time domain
figure;
plot(t, real(signal_clean));
title('Cleaned Signal (Time Domain)');
xlabel('Time');
ylabel('Amplitude');
