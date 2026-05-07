clc;
clear all;
close all;
pkg load signal;

disp('FIR FILTER USING RECTANGULAR WINDOW');

n = input('Enter number of samples = ');
w = input('Enter cutoff frequency for LPF and HPF = ');

n = n - 1;

% LOW PASS FILTER
lpf = fir1(n,w/pi,rectwin(n+1));

[h,w1] = freqz(lpf,1,256);

m = 20*log10(abs(h));

figure;

subplot(2,2,1);
plot(w1/pi,m);
grid on;
title('LPF using Rectangular Window');
xlabel('Normalized Frequency');
ylabel('Gain in dB');

% HIGH PASS FILTER
hpf = fir1(n,w/pi,'high',rectwin(n+1));

[h1,w2] = freqz(hpf,1,256);

m1 = 20*log10(abs(h1));

subplot(2,2,2);
plot(w2/pi,m1);
grid on;
title('HPF using Rectangular Window');
xlabel('Normalized Frequency');
ylabel('Gain in dB');

% BAND PASS FILTER
wc1 = input('Enter first cutoff frequency = ');
wc2 = input('Enter second cutoff frequency = ');

wn = [wc1 wc2]/pi;

bpf = fir1(n,wn,'bandpass',rectwin(n+1));

[h2,w3] = freqz(bpf,1,256);

m2 = 20*log10(abs(h2));

subplot(2,2,3);
plot(w3/pi,m2);
grid on;
title('BPF using Rectangular Window');
xlabel('Normalized Frequency');
ylabel('Gain in dB');

% BAND STOP FILTER
wc3 = input('Enter first cutoff frequency = ');
wc4 = input('Enter second cutoff frequency = ');

wn1 = [wc3 wc4]/pi;

bsf = fir1(n,wn1,'stop',rectwin(n+1));

[h3,w4] = freqz(bsf,1,256);

m3 = 20*log10(abs(h3));

subplot(2,2,4);
plot(w4/pi,m3);
grid on;
title('BSF using Rectangular Window');
xlabel('Normalized Frequency');
ylabel('Gain in dB');