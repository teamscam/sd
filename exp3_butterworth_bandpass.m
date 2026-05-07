clc;
clear all;
close all;
pkg load signal;

format long;

rp = input('Enter the passband ripple (rp) = 0.25');
rs = input('Enter the stopband ripple (rs) = 20');

wp1 = input('Enter the lower passband frequency = 1000');
wp2 = input('Enter the upper passband frequency = 2000');

fs = input('Enter the sampling frequency = 15000');

wp = [2*wp1/fs 2*wp2/fs];

ws = [2*(wp1-500)/fs 2*(wp2+500)/fs];

[n,wn] = buttord(wp,ws,rp,rs);

[b,a] = butter(n,wn,'bandpass');

disp('Filter order = ');
disp(n);

disp('Cutoff frequency = ');
disp(wn);

w = 0:0.01:pi;

[h,om] = freqz(b,a,w);

m = 20*log10(abs(h));
an = angle(h);

figure;

subplot(2,1,1);
plot(om/pi,m);
grid on;
title('Butterworth Band Pass Filter');
xlabel('Normalized Frequency');
ylabel('Gain in dB');

subplot(2,1,2);
plot(om/pi,an);
grid on;
title('Phase Response');
xlabel('Normalized Frequency');
ylabel('Phase in radians');