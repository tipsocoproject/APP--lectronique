% Question G
% D�composition du signal audio
[x,Fe] = audioread('bonjour.wav');
sound(x);                   % Ecoute du signal

% Question H
Te = 1/Fe;                  % P�riode d'�chantillonnage
N = length(x);              % Nombre d'�chantillons dans le signal
f = (0:1/(N-1):1)*Fe;       % Intervalle de fr�quence �tudi�
X = fft(x);                 % transform�e de Fourier du signal
Xabs = abs(X);              % D�finition des valeurs du module de la FFT
XdB = 20*log10(Xabs);       % Valeurs de module du gain en dB de la FFT

% Obervation graphique
figure
plot(f,XdB)
xlabel('Fr�quence (Hz)')
ylabel('Gain du signal (dB)')
title('Transform�e de Fourier du signal bonjour.wav')

% On observe une occupation spectrale sur 6000 Hz

% question I
k = 6;                      % Facteur de d�cimation
y = decimate(x,k);          % Sous-�chantillonnage du signal bonjour.wav
M = length(y);              % Nombre d'�chantillons dans le nouveau signal
Fse = Fe/k;                 % Fr�quence de sous-�chantillonnage
fse = (0:1/(M-1):1)*Fse;    % Nouvel intervalle de fr�quence �tudi�
Tse = 1/Fse;                % P�riode de sous-�chantillonnage
tse = (0:M-1)*Tse;          % Nouvel intervalle de temps �tudi�
Y = fft(y);                 % FFT du signal sous �chantillonn�
Yabs = abs(Y);              % D�finition des valeurs du module de la FFT
YdB = 20*log10(Yabs);       % Valeurs de module du gain en dB de la FFT

% Observation graphique
figure
subplot(2,1,1)
plot(tse,y)
xlabel('Temps (s)')
ylabel('Volt (V)')
title('Signal sous-�chantillonn� bonjour.wav')
subplot(2,1,2)
plot(fse,YdB)
xlabel('Fr�quence (Hz)')
ylabel('Gain du signal (dB)')
title('Transform�e de Fourier du signal sous-�chantillonn� bonjour.wav')

sound(y);                   % Ecoute du signal sous-�chantillonn�

% Ce signal sous-�chantillonn� est mieux restitu� que l'ancien signal.

% Question J et K
% La plus grande valeur acceptable lors du choix du facteur de d�cimation
% pour le sous-�chantillonnage du signal bonjour.wav est 7, car les valeurs
% de fr�quences obtenues pour des valeurs d'un facteur k > 7 se replient
% sur les fr�quences fondamentales f < 6000 Hz.
% Il faut donc, avant de sous-�chantillonner un signal, veiller � bien
% respecter le crit�re de Shannon afin d'�viter tout repliement de spectre,
% c'est-�-dire d'avoir Fe >= 2*k*fmax avec k entier positif non nul.


