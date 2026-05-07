clc;
clear all;
close all;
pkg load signal;

n = input('Enter number of samples = ');
wc = input('Enter cutoff frequency for LPF and HPF = ');

n = n - 1;

figure;

% LPF
lpf = fir1(n,wc/pi,hann(n+1));

[h,w] = freqz(lpf,1,1024);

subplot(2,2,1);
plot(w/pi,20*log10(abs(h)));
grid on;
title('LPF using Hanning window');
xlabel('normalized freq');
ylabel('gain in dB');

% HPF
hpf = fir1(n,wc/pi,'high',hann(n+1));

[h1,w1] = freqz(hpf,1,1024);

subplot(2,2,2);
plot(w1/pi,20*log10(abs(h1)));
grid on;
title('HPF using Hanning window');
xlabel('normalized freq');
ylabel('gain in dB');

% BPF
wc1 = input('Enter first cutoff frequency = ');
wc2 = input('Enter second cutoff frequency = ');

wn = [wc1 wc2]/pi;

bpf = fir1(n,wn,'bandpass',hann(n+1));

[h2,w2] = freqz(bpf,1,1024);

subplot(2,2,3);
plot(w2/pi,20*log10(abs(h2)));
grid on;
title('BPF using Hanning window');
xlabel('normalized freq');
ylabel('gain in dB');

% BSF
wc3 = input('Enter first cutoff frequency = ');
wc4 = input('Enter second cutoff frequency = ');

wn1 = [wc3 wc4]/pi;

bsf = fir1(n,wn1,'stop',hann(n+1));

[h3,w3] = freqz(bsf,1,1024);

subplot(2,2,4);
plot(w3/pi,20*log10(abs(h3)));
grid on;
title('BSF using Hanning window');
xlabel('normalized freq');
ylabel('gain in dB');