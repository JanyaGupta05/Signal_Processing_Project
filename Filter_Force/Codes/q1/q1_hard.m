f = 44100;
audiopath = 'C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\q1\q1_hard.wav';
[x, fs] = audioread(audiopath);

t_x = 0:1/f:(length(x)-1)/f;
p = audioplayer(x, fs);

% play original signal
% play(p);

% Plot original signal
subplot(3,1,1)
plot(t_x,x);
title('Original Signal');
xlabel('n');
ylabel('x[n]');

alpha = 0.8;

% Create impulse response with echo
h = zeros(1, f*2);
h(1) = 1;
h(f*2) = alpha;
t_h = 0:1/f:(length(h)-1)/f;

subplot(3,1,2);
stem(t_h,h);
title('Impulse Response');
xlabel('n');
ylabel('h[n]');

% Apply convolution to each channel separately
y_left = conv(x(:, 1), h);
y_right = conv(x(:, 2), h);

% Combine the channels
y = [y_left, y_right];

% Plot echo signal
subplot(3,1,3);
t_y = 0:1/f:(length(y)-1)/f;
plot(t_y,y);
title('Echo Signal');
xlabel('n');
ylabel('y[n]');

% Play Echo Signal
p1 = audioplayer(y, fs);
play(p1);



