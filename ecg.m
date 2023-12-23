% Simulated ECG signal
fs = 1000; % Sampling frequency (Hz)
t = 0:1/fs:5; % Time vector (5 seconds)
f1 = 0.5; % Frequency of the ECG waveform (Hz)
ecg_signal = 1.5*sin(2*pi*f1*t); % Simulated ECG signal

% Add noise to simulate a real ECG signal
noise = 0.5*randn(size(t));
ecg_signal_noisy = ecg_signal + noise;

% Find peaks in the ECG signal
[peaks, locs] = findpeaks(ecg_signal_noisy, 'MinPeakHeight', 1, 'MinPeakDistance', 0.3*fs);

% Plot the ECG signal with detected peaks
figure;
plot(t, ecg_signal_noisy);
hold on;
plot(t(locs), peaks, 'ro', 'MarkerSize', 10);
xlabel('Time (s)');
ylabel('Amplitude');
title('ECG Signal with Detected Peaks');
legend('ECG Signal', 'Detected Peaks');
