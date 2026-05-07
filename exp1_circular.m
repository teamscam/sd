clc;
clear all;
close all;

x = [1 1 2 1 1];
h = [1 1 2 1];

Nx = length(x);
Nh = length(h);

N = max(Nx,Nh);

y = cconv(x,h,N);

figure;

n = 0:1:Nx-1;
subplot(3,1,1);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('Input Sequence');

n = 0:1:Nh-1;
subplot(3,1,2);
stem(n,h);
xlabel('n');
ylabel('h(n)');
title('Impulse Sequence');

n = 0:1:N-1;
subplot(3,1,3);
stem(n,y);
xlabel('n');
ylabel('y(n)');
title('Circular Convolution');