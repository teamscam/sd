clc;
clear all;
close all;
pkg load signal;

rp = input('Enter the pass band ripple = 0.25');
rs = input('Enter the stop band ripple = 20');

wp1 = input('Enter the lower pass band frequency =1200 ');
wp2 = input('Enter the upper pass band frequency =2400 ');

fs = input('Enter the sampling frequency = 15000');

wp = [wp1/(fs/3) wp2/(fs/3)];

ws = [(wp1-400)/(fs/3) (wp2+400)/(fs/3)];

[n,wn] = cheb1ord(wp,ws,rp,rs);

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
title('Chebyshev Band Pass Filter');
xlabel('Normalized Frequency');
ylabel('Gain in dB');

subplot(2,1,2);
plot(om/pi,an);
grid on;
xlabel('Normalized Frequency');
ylabel('Phase in radians');