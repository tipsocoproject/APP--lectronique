% Question B

A = 1;                          % Amplitude du signal
F0 = 440;                       % Frequence du fondamental 1
Fe1 = 8000;                     % Frequence d'echantillonnage
Te1 = 1/Fe1;                    % Periode d'echantillonnage
t = 0:Te1:0.1;                  % Temps d'etude
x1 = A*sin(2*pi*F0*t);          % Signal d'etude
M = 2^11;                       % Nombre de points
X1 = fft(abs(x1),M);            % FFT du signal 1

% Construction du graphe

figure
plot(t,x1)
xlabel('Points')
ylabel('Volt (V)')
title('Signal')

figure

% Le sginal est reconstruit de sorte a respecter la condition de
% Shannon, le signal est 
% Question C

Fe2 = 500;                      % Frequence du fondamental 2
x2 = A*sin(2*pi*F0*t);      % Signal d'etude
X2 = fft(abs(x2));              % FFT du signal 2

figure(1)
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

%Question L

%Question M