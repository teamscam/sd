clc;
clear all;
close all;
pkg load signal;

rp = input('Enter the pass band ripple =0.5 ');
rs = input('Enter the stop band ripple = 50');
wp = input('Enter the pass band frequency =1200 ');
ws = input('Enter the stop band frequency = 2400');
fs = input('Enter the sampling frequency = 15000');

w1 = 2*wp/fs;
w2 = 2*ws/fs;

[n,wn] = cheb1ord(w1,w2,rp,rs);

[b,a] = cheby1(n,rp,wn);

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
title('Chebyshev Low Pass Filter');
xlabel('Normalized Frequency');
ylabel('Gain in dB');

subplot(2,1,2);
plot(om/pi,an);
grid on;
xlabel('Normalized Frequency');
ylabel('Phase in radians');