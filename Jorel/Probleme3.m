% Chargement du signal audio chord1.wav
[x,Fe] = audioread('chord1.wav');

% Determination de l'occupation spectrale du signal
N = length(x);
pas = Fe/(N-1);
f = 0:pas:Fe;
X = fft(x);
Xabs = abs(X);
XdB = 20*log10(Xabs);
figure
subplot(2,1,1)
plot(f,XdB)
ylabel('Frequence')
ylabel('Module du signal')
title('Transformee de Fourier du signal chord1.wav')

% Occupation spectrale d'environ 650 Hz
% Sous-echantillonnage du signal
k = floor(Fe/(2*650));
y = decimate(x,k);
M = length(y);
fy = 0:Fe/(M-1):Fe;
Y = fft(y);
Yabs = abs(Y);
YdB = 20*log10(Yabs);

subplot(2,1,2)
plot(fy,YdB);
ylabel('Frequence')
ylabel('Module du signal')
title('Transformee de Fourier du signal sous-echantillonne chord1.wav')
% sound(x);
sound(y);

% Chargement du signal audio Chord2.wav
[x2,Fe2] = audioread('Chord2.wav');

% Determination de l'occupation spectrale du signal
N = length(x2);
Te2 = 1/Fe2;
pas = Fe2/(N-1);
t = (0:N-1)*Te2;
f2 = 0:pas:Fe2;
X2 = fft(x2);
X2abs = abs(X2);
X2dB = 20*log10(X2abs);
figure
subplot(2,1,1)
plot(t,x2)
ylabel('Frequence')
ylabel('Module du signal')
title('Transformee de Fourier du signal Chord2.wav')
