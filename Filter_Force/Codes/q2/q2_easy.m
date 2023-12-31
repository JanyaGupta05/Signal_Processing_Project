echo_audiofile = 'C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\q2\q2_easy.wav';
desired_audiofile = "Audiopath";

f = 44100;
x = loadAudioFile(desired_audiofile);
y = loadAudioFile(echo_audiofile);

desiredSignal = x;
echoedSignal = y;

t_desired = 0:1/f:(length(desiredSignal)-1)/f;
t_echoed = 0:1/f:(length(echoedSignal)-1)/f;

disp(length(desiredSignal));
outputSignal = echo_cancelation(desiredSignal,echoedSignal);
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

% play(p1);
% play(p2)
% play(p3);