clc;
clear all;
close all;
pkg load signal;

format long;

rp = input('Enter the passband ripple (rp) = 0.5');
rs = input('Enter the stopband ripple (rs) = 50');
wp = input('Enter the passband frequency (wp) = 1200');
ws = input('Enter the stopband frequency (ws) = 2400');
fs = input('Enter the sampling frequency (fs) = 10000');

w1 = 2*wp/fs;
w2 = 2*ws/fs;

[n,wn] = buttord(w1,w2,rp,rs);

[b,a] = butter(n,wn);

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
title('Butterworth Low Pass Filter');
xlabel('Normalized Frequency');
ylabel('Gain in dB');

subplot(2,1,2);
plot(om/pi,an);
grid on;
xlabel('Normalized Frequency');
ylabel('Phase in radians');