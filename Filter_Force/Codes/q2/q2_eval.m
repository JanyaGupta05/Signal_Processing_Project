f = 44100;
audiopath = 'C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\Codes\q2\hindi_2s.wav';
[x, fs] = audioread(audiopath);

t_x = 0:1/f:(length(x)-1)/f;
%p = audioplayer(x,f);
% play original signal
% play(p);


alpha = 0.3;
h = zeros(1,2*f);
h(1) = 1;
h(2*f) = alpha;
t_h = 0:1/f:(length(h)-1)/f;


% convolution
y = conv(x,h);
t_y = 0:1/f:(length(y)-1)/f;


desiredSignal = x;
echoedSignal = y;


t_desired = 0:1/f:(length(desiredSignal)-1)/f;
t_echoed = 0:1/f:(length(echoedSignal)-1)/f;


outputSignal = echo_cancelation(desiredSignal,echoedSignal(1:133441));
t_output = 0:1/f:(length(outputSignal)-1)/f;

% Plots
figure;
subplot(3,1,1);
plot(t_desired,desiredSignal, 'b');
title('Desired Signal (Original Signal without Echo)');

subplot(3,1,2);
plot(t_echoed,echoedSignal, 'r');
title('Echoed Signal (Input with Echo)');

subplot(3,1,3);
plot(t_output,outputSignal,'g');
title('Output Signal after Echo Cancellation');

% AudioPlayer
p1 = audioplayer(desiredSignal,fs);
p2 = audioplayer(echoedSignal,fs);
p3 = audioplayer(outputSignal,fs);

%play(p1);
%play(p2)
play(p3);