% Probl�me 4
% On limite la fr�quence maximale � 500 Hz afin d'avoir dans le spectre des
% fr�quences nos fondamentaux FA medium (349 Hz) et LA medium (440 Hz).

% Chargement du signal chord_LA_FA.wav
[x,Fe] = audioread('chord_LA_FA.wav');

Te = 1/Fe;                      % P�riode d'�chantillonnage
fmax = 500;                     % Fr�quence max
Fse = 2*fmax;                   % Fr�quence de sous-�chantillonnage
kDouble = Fe/(2*fmax);          % Facteur de d�cimation non entier
k = floor(kDouble);             % Facteur de d�cimation
N = length(x);
t1 = (0:(N-1))*Te;

% Sous-�chantillonnage du signal afin de limiter la complexit� des futurs
% traitements � appliquer.
y = decimate(x,k);              % Signal sous-�chantillonn�
M = length(y);                  % Nombre d'�chantillons
t = (0:M-1)*Te;                 % Intervalle de temps d'�tude
f = (0:1/(M-1):1)*Fse;          % Intervalle de fr�quence d'�tude
Y = fft(y);                     % Transform�e de Fourier du signal d�cim�
Yabs = abs(Y);                  % Module de la FFT du signal d�cim�
YdB = 20*log10(Yabs);           % FFT avec module de gain en dB

% Affichage de la FFT du signal d�cim�
figure
plot(f,YdB)

figure
plot(t1,x)

% Test de puissance du signal :
% Calcul de la puissance moyenne estim�e du signal sous-�chantillonn�

% Hypoth�se de pr�sence du bruit n�cessaire � la d�finition de la puissance
% suppos� dans un intervalle de temps compris entre 0 et 150 ms.

n150 = floor(0.15/Te) + 1;      % Echantillon pris � environ 150 ms.
yBruit = y(1:n150);             % Hypoth�se de temps du bruit
YBruit = fft(yBruit,M);         % Transform�e de Fourier sur le bruit
YBruitAbs = abs(YBruit);        % Module de la FFT sur le signal bruit�
Gseuil = max(YBruitAbs);        % Seuil de puissance du signal

K = 50;                         % Fen�tre de fr�quence
Pres = zeros(1,M);              % Pr�allocation de m�moire

for n = 1+K:1:M-K
    yfen = y(n-K:n+K);
    Yfen = fft(yfen);           % Transform�e de Fourier sur la fen�tre
    YfenAbs = abs(Yfen);
    
    %test de la pr�sence du signal
    if YfenAbs <= Gseuil        % Absence du signal
        Pres(n-K)=0;
    else
        Pres(n-K)=1;            % Pr�sence du signal
    end
end

figure
plot(t,y)

figure
plot(t,Pres)
sound(x);







