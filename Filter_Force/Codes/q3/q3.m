inputAudioFile = 'C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\q3\music_city-traffic.wav';

audio = loadAudioFile(inputAudioFile);

noiseType = classifyNoise(audio(:,1));

% for multiple channel we can use audio(:,1{n}) {n: denotes the nth channel)

disp(['The detected noise type is: ' noiseType]);
