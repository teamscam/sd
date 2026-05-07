clc;
clear all;
close all;

% Fast Fourier Transform
disp('FAST FOURIER TRANSFORM');

l = input('Enter the length =4 ');
x = input('Enter the input sequence =1 2 3 4 ');

y = fft(x,l);

disp('Resultant FFT sequence');
disp(y);

figure;

subplot(2,2,1);
stem(x);
title('Input Sequence');
xlabel('n ---->');
ylabel('x(n)');

subplot(2,2,2);
stem(abs(y));
title('FFT Sequence');
xlabel('Frequency ---->');
ylabel('|X(k)|');

% Inverse Fast Fourier Transform
disp('INVERSE FAST FOURIER TRANSFORM');

x1 = input('Enter the FFT sequence = 10 -2+2i -2 -2-2i');

y1 = ifft(x1);

disp('Resultant IFFT sequence');
disp(y1);

subplot(2,2,3);
stem(abs(x1));
title('FFT Input Sequence');
xlabel('Frequency ---->');
ylabel('X(k)');

subplot(2,2,4);
stem(real(y1));
title('IFFT Sequence');
xlabel('n ---->');
ylabel('x(n)');