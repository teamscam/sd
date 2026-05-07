clc;
clear all;
close all;

x = input('enter 1st seq = 5 6 7 8');
h = input('enter 2nd seq = 8 7 6 5');

y = conv(x,h);

figure;

subplot(3,1,1);
stem(x);
ylabel('Amplitude');
xlabel('n ---->');
title('Input Sequence x(n)');

subplot(3,1,2);
stem(h);
ylabel('Amplitude');
xlabel('n ---->');
title('Impulse Sequence h(n)');

subplot(3,1,3);
stem(y);
ylabel('Amplitude');
xlabel('n ---->');
title('Linear Convolution Output');

disp('The result is');
disp(y);