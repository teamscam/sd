clc;
clear all;
close all;
pkg load signal;

n = input('Enter number of samples = ');
wc = input('Enter cutoff frequency for LPF and HPF = ');

n = n - 1;

figure;

% LPF
lpf = fir1(n,wc/pi,'low',hamming(n+1));

[h,w] = freqz(lpf,1,1024);

subplot(2,2,1);
plot(w/pi,20*log10(abs(h)));
title('LPF using Hamming window');
xlabel('normalized freq');
ylabel('gain in dB');
grid on;

% HPF
hpf = fir1(n,wc/pi,'high',hamming(n+1));

[h1,w1] = freqz(hpf,1,1024);

subplot(2,2,2);
plot(w1/pi,20*log10(abs(h1)));
title('HPF using Hamming window');
xlabel('normalized freq');
ylabel('gain in dB');
grid on;

% BPF
wc1 = input('Enter first cutoff frequency = ');
wc2 = input('Enter second cutoff frequency = ');

wn = [wc1/pi wc2/pi];

bpf = fir1(n,wn,hamming(n+1));

[h2,w2] = freqz(bpf,1,1024);

subplot(2,2,3);
plot(w2/pi,20*log10(abs(h2)));
title('BPF using Hamming window');
xlabel('normalized freq');
ylabel('gain in dB');
grid on;

% BSF
wc3 = input('Enter first cutoff frequency = ');
wc4 = input('Enter second cutoff frequency = ');

wn1 = [wc3/pi wc4/pi];

bsf = fir1(n,wn1,'stop',hamming(n+1));

[h3,w3] = freqz(bsf,1,1024);

subplot(2,2,4);
plot(w3/pi,20*log10(abs(h3)));
title('BSF using Hamming window');
xlabel('normalized freq');
ylabel('gain in dB');
grid on;