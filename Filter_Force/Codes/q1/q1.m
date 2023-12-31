f = 44100;
audiopath = 'C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\q1\\q1.wav';
[x, fs] = audioread(audiopath);

t_x = 0:1/f:(length(x)-1)/f;
p = audioplayer(x,f);
% play original signal
% play(p);

% Plot of Original Signal
subplot(3,1,1)
plot(t_x,x);
title('Original Signal');
xlabel('n');
ylabel('x[n]');


alpha = 0.3;
h = zeros(1,1*f);
h(1) = 1;
h(1*f) = alpha;
t_h = 0:1/f:(length(h)-1)/f;

% Plot of Impulse Response
subplot(3,1,2);
stem(t_h,h);
title('Impulse Response');
xlabel('n');
ylabel('h[n]');

% convolution
y = conv(x,h);
t_y = 0:1/f:(length(y)-1)/f;

% Plot of echo signal
subplot(3,1,3);
plot(t_y,y);
title('Echo Signal');
xlabel('n');
ylabel('y[n]');

% Play Echo Signal
p1 = audioplayer(y,f);
play(p1);