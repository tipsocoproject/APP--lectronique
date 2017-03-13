% Question G
% Décomposition du signal audio
[x,Fe] = audioread('bonjour.wav');
sound(x);                   % Ecoute du signal

% Question H
Te = 1/Fe;                  % Période d'échantillonnage
N = length(x);              % Nombre d'échantillons dans le signal
f = (0:1/(N-1):1)*Fe;       % Intervalle de fréquence étudié
X = fft(x);                 % transformée de Fourier du signal
Xabs = abs(X);              % Définition des valeurs du module de la FFT
XdB = 20*log10(Xabs);       % Valeurs de module du gain en dB de la FFT

% Obervation graphique
figure
plot(f,XdB)
xlabel('Fréquence (Hz)')
ylabel('Gain du signal (dB)')
title('Transformée de Fourier du signal bonjour.wav')

% On observe une occupation spectrale sur 6000 Hz

% question I
k = 6;                      % Facteur de décimation
y = decimate(x,k);          % Sous-échantillonnage du signal bonjour.wav
M = length(y);              % Nombre d'échantillons dans le nouveau signal
Fse = Fe/k;                 % Fréquence de sous-échantillonnage
fse = (0:1/(M-1):1)*Fse;    % Nouvel intervalle de fréquence étudié
Tse = 1/Fse;                % Période de sous-échantillonnage
tse = (0:M-1)*Tse;          % Nouvel intervalle de temps étudié
Y = fft(y);                 % FFT du signal sous échantillonné
Yabs = abs(Y);              % Définition des valeurs du module de la FFT
YdB = 20*log10(Yabs);       % Valeurs de module du gain en dB de la FFT

% Observation graphique
figure
subplot(2,1,1)
plot(tse,y)
xlabel('Temps (s)')
ylabel('Volt (V)')
title('Signal sous-échantillonné bonjour.wav')
subplot(2,1,2)
plot(fse,YdB)
xlabel('Fréquence (Hz)')
ylabel('Gain du signal (dB)')
title('Transformée de Fourier du signal sous-échantillonné bonjour.wav')

sound(y);                   % Ecoute du signal sous-échantillonné

% Ce signal sous-échantillonné est mieux restitué que l'ancien signal.

% Question J et K
% La plus grande valeur acceptable lors du choix du facteur de décimation
% pour le sous-échantillonnage du signal bonjour.wav est 7, car les valeurs
% de fréquences obtenues pour des valeurs d'un facteur k > 7 se replient
% sur les fréquences fondamentales f < 6000 Hz.
% Il faut donc, avant de sous-échantillonner un signal, veiller à bien
% respecter le critère de Shannon afin d'éviter tout repliement de spectre,
% c'est-à-dire d'avoir Fe >= 2*k*fmax avec k entier positif non nul.


