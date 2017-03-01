% Question A
A1 = 2;                         % Amplitude du premier signal
F1 = 500;                       % Frequence du fondamental
Fe = 8000;                      % Frequence d'echantillonnage
t = 0:1/Fe:0.05;                % Intervalle d'etude en temps
N = length(t);                  % Nombre d'echantillons
f = 0:Fe/(N-1):8000;            % Intervalle d'etude en frequence

xt1 = A1*sin(2*pi*F1*t);        % Signal sinusoidal 1
Y1 = fft(xt1);                  % Transformee de Fourier du signal xt1

figure
plot(f,10*log(Y1))              % Affichage en dB du signal Y1
grid on

% Question B
A2 = 1;                         % Amplitude du second signal
F2 = 600;                       % Frequence du fondamental
xt2 = A2*sin(2*pi*F2*t);        % Signal sinusoidal 2
Y2 = fft(xt2);                  % Transformee de Fourier du signal xt2

Y3 = fft(xt1+xt2);              % Transformee de Fourier du signal xt1+xt2

figure
subplot(2,1,1)
plot(f,10*log(Y1+Y2))           % Affichage en dB du signal Y1+Y2
axis([0,220,-10,60])
grid on
subplot(2,1,2)
plot(f,10*log(Y3))              % Affichage en dB du signal Y3
axis([0,220,-10,60])
grid on

% Question C
xt4 = rectangularPulse(0,0.05,x);

% Question D
syms x
[x,Fe] = audioread('2notes.wav');   % Lecture du fichier audio
N = length(x);                      % Nombre d'echantillons
f = 0:Fe/(N-1):Fe;                  % Intervalle de fréquence
X = fft(x);                         % Transformee de Fourier du signal

% Graphe du signal
figure
plot(f,10*log(X))

% Question E
