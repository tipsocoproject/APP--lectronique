% Problème 4
% On limite la fréquence maximale à 500 Hz afin d'avoir dans le spectre des
% fréquences nos fondamentaux FA medium (349 Hz) et LA medium (440 Hz).

% Chargement du signal chord_LA_FA.wav
[x,Fe] = audioread('chord_LA_FA.wav');

Te = 1/Fe;                      % Période d'échantillonnage
fmax = 500;                     % Fréquence max
Fse = 2*fmax;                   % Fréquence de sous-échantillonnage
kDouble = Fe/(2*fmax);          % Facteur de décimation non entier
k = floor(kDouble);             % Facteur de décimation
N = length(x);
t1 = (0:(N-1))*Te;

% Sous-échantillonnage du signal afin de limiter la complexité des futurs
% traitements à appliquer.
y = decimate(x,k);              % Signal sous-échantillonné
M = length(y);                  % Nombre d'échantillons
t = (0:M-1)*Te;                 % Intervalle de temps d'étude
f = (0:1/(M-1):1)*Fse;          % Intervalle de fréquence d'étude
Y = fft(y);                     % Transformée de Fourier du signal décimé
Yabs = abs(Y);                  % Module de la FFT du signal décimé
YdB = 20*log10(Yabs);           % FFT avec module de gain en dB

% Affichage de la FFT du signal décimé
figure
plot(f,YdB)

figure
plot(t1,x)

% Test de puissance du signal :
% Calcul de la puissance moyenne estimée du signal sous-échantillonné

% Hypothèse de présence du bruit nécessaire à la définition de la puissance
% supposé dans un intervalle de temps compris entre 0 et 150 ms.

n150 = floor(0.15/Te) + 1;      % Echantillon pris à environ 150 ms.
yBruit = y(1:n150);             % Hypothèse de temps du bruit
YBruit = fft(yBruit,M);         % Transformée de Fourier sur le bruit
YBruitAbs = abs(YBruit);        % Module de la FFT sur le signal bruité
Gseuil = max(YBruitAbs);        % Seuil de puissance du signal

K = 50;                         % Fenêtre de fréquence
Pres = zeros(1,M);              % Préallocation de mémoire

for n = 1+K:1:M-K
    yfen = y(n-K:n+K);
    Yfen = fft(yfen);           % Transformée de Fourier sur la fenêtre
    YfenAbs = abs(Yfen);
    
    %test de la présence du signal
    if YfenAbs <= Gseuil        % Absence du signal
        Pres(n-K)=0;
    else
        Pres(n-K)=1;            % Présence du signal
    end
end

figure
plot(t,y)

figure
plot(t,Pres)
sound(x);







