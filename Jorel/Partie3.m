clear all;
clc;

% Question B
A = 1;                          % Amplitude du signal
F0 = 440;                       % Frequence du fondamental 1
Fe1 = 8000;                     % Frequence d'echantillonnage
Te1 = 1/Fe1;                    % Periode d'echantillonnage
duree = 0.1;                    % durée de l'échatillonnage
t = 0:Te1:duree;                % Temps d'etude
s1 = A*sin(2*pi*F0*t);          % Signal d'etude
N1 = length(s1);                % longueur du signal x1
M = 2^11;                       % Nombre de points
X1 = fft(s1,M);                 % FFT du signal 1
X1abs = abs(X1);                % abs de la fft du sugnal 1
f = 0:Fe1/(M-1):Fe1;                % fréquences abscisse

% Construction du graphe

figure(1)
subplot(2,1,1)
plot(t,s1)
xlabel('Points')
ylabel('Volt (V)')
title('Signal')

subplot(2,1,2)
plot(f,X1)
xlabel('fréquences')
ylabel('dB')
title('Module de la FTT du signal')

% Le signal est reconstruit de sorte à respecter le critère de
% Shannon, ie Fe>=2*fmax.
 
% Question C

Fe2 = 500;                      % Frequence du fondamental 2
x2 = A*sin(2*pi*F0*t);          % Signal d'etude
X2 = fft(abs(x2));              % FFT du signal 2

figure(2)
hold on
plot(N,x1,'mo')
xlabel('Points')
ylabel('Volt (V)')
title('Signal')
axis([0 500 -1.10 1.10])

% Question G & H

[s,Fs] = audioread('bonjour.wav');
sound(y);
L = length(s);
pas = Fs/(L-1);
y = fft(s);
f = 0:pas:Fs;
Ydb = 20*log10(abs(y));

figure
plot(f,Ydb)

% Question I & J

k = 6;
N = length(s);
Ts = 1/Fs;
pas = k*Ts;
y1 = s/k;
sound(y1)

% Question K
% Pour eviter le recouvrement de spectre, il faut sous-echantillonner
% le signal de sorte que Fe >= 2fmax/k

% Question L

% Question M