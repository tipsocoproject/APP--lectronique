clear all;
clc;

% Question B
A = 1;                          % Amplitude du signal
F0 = 440;                       % Frequence du fondamental 1
Fe1 = 8000;                     % Frequence d'echantillonnage
Te1 = 1/Fe1;                    % Periode d'echantillonnage
duree = 0.1;                    % durée de l'échatillonnage
t1 = 0:Te1:duree;               % Temps d'etude
s1 = A*sin(2*pi*F0*t1);         % Signal d'etude
N1 = length(s1);                % longueur du signal x1
M = 2^11;                       % Nombre de points
X1 = fft(s1,M);                 % FFT du signal 1
X1abs = abs(X1);                % abs de la fft du signal 1
X1absdB = 20*log10(X1abs);      % le gain en dB
f1 = 0:Fe1/(M-1):Fe1;           % fréquences abscisse

% Construction du graphe

figure(1)
subplot(2,1,1)
plot(t1,s1)
xlabel('Temps en secondes')
ylabel('Volt (V)')
title('Signal 1')

subplot(2,1,2)
plot(f1,X1absdB)
xlabel('fréquences')
ylabel('dB')
title('Module de la FTT du signal')

% Le signal est reconstruit de sorte à respecter le critère de
% Shannon, ie Fe>=2*fmax.
 
% Question C
Fe2 = 500;                      % Frequence du fondamental 2
Te2 = 1/Fe2;                    % période d'échantillonnage
t2 = 0:Te2:duree;               % temps d'étude du signal 2
s2 = A*sin(2*pi*F0*t2);         % Signal d'etude
X2 = fft(s2,M);                 % FFT du signal 2
X2abs = abs(X2);                % abs de la fft du signal 2
X2absdB = 20*log10(X2abs);      % le gain en dB

f2 = 0:Fe2/(M-1):Fe2;           % fréquences abscisse

% Construction du graphe

figure(2)
subplot(2,1,1)
plot(t2,s2)
xlabel('Temps en secondes')
ylabel('Volt (V)')
title('Signal 2')

subplot(2,1,2)
plot(f2,X2absdB)
xlabel('fréquences')
ylabel('dB')
title('Module de la FTT du signal')

% Signal 1 : on remarque que le signal échantillonné à 8 000 Hz est
% périodique. On a donc qu'un seul pic dans la FFT. L'occupation spectrale
% du signal est très grande, il faudra donc réduire la fréquence
% d'échantillonnage du signal pour en avoir une plus petite.

% Signal 2 : on obtient le même signal que le précédent mais échantillonné à
% 800 Hz. La FFT du signal nous montre un sous-échantillonnage. En effet,
% on a une mauvaise restitution du signal car on observe la présence d'un
% sinus cardinal autour de la fréquence 75 Hz.

% Question D
figure(3)
plot(t1,s1,'b',t2,s2,'mo')
xlabel('temps');
ylabel('signal s1 et s2');
title('Signaux s1 et s2');

% Le signal n'est pas assez échantilloné pour le signal 2.
% On prend 2 crêtes identiques pour identifier le motif sur s2
% Sur le motif, on compte 22 périodes pour s1 et 3 pour s2
% Donc il faudrait un signal s3 de fréquence égale à f3=F0/(22/3)
% ie environ égale à F0/7.

% Question E 
% Si l'on déséchantillonne à la fréquence fe2/2, on retrouverait un signal 
% non lissé et pas fidèle au signal s2 initial.
% Le signal n'est pas correctement reconstitué. 
% Pour cause, la fréquence d'échantillonage fe2=0,5 KHz ne respecte pas le
% critère de Shannon. 

% Question F
% Le théorème de Shannon permet d'échantillonner correctement un signal. 
% On sélectionne toutes les valeurs du signal à une fréquence au moins 
% 2 fois supérieure à la fréquence maximum de ce signal.
% Cela permet d'éviter les repliments de spectre et les mauvaises
% restitutions de signaux. Physiquement, un mauvais échantillonnage va
% supprimer des fréquences du signal et également ralentir ou accélérer le
% débit musical, ie qu'il y a distorsion sonore du signal.

% Question G & H

[s,Fs] = audioread('../Signaux/bonjour.wav');   % importation du fichier
sound(s,Fs);                % écoute du signal
L = length(s);              % longueur du signal
pas = Fs/(L-1);             % pas de d'échantillonnage
y = fft(s);                 % fft du signal
yabs = abs(y);              % abs de la fft du signal
f = 0:pas:Fs;               % fréquence en abscisse
Ydb = 20*log10(yabs);       % module de la fft du signal

% La fréquence d'échantillonnage du signal est de 44100 Hz.

figure(4)
plot(f,Ydb)
xlabel('fréquences')
ylabel('|Ydb| Module du signal')
title('Spectre du signal')

% L'occupation spectrale de ce spectrale est environ de 6500Hz. 


% Question I & J

k = 6;
Ts = 1/Fs;
pas = k*Ts;
y1 = s/k;
sound(y1)

% Question K
% Pour eviter le recouvrement de spectre, il faut sous-echantillonner
% le signal de sorte que Fe >= 2fmax/k
% On a donc besoin d'un filtre interpolateur.

% Question L


% Question M
% Plus la fréquence d'échantillonnage est élevée plus il faut de bits de
% quantification pour restituer correctement le signal.

