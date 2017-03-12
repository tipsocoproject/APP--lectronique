clear all;
clc;

% Question B
A = 1;                          % Amplitude du signal
F0 = 440;                       % Frequence du fondamental 1
Fe1 = 8000;                     % Frequence d'echantillonnage
Te1 = 1/Fe1;                    % Periode d'echantillonnage
duree = 0.1;                    % dur�e de l'�chatillonnage
t1 = 0:Te1:duree;               % Temps d'etude
s1 = A*sin(2*pi*F0*t1);         % Signal d'etude
N1 = length(s1);                % longueur du signal x1
M = 2^11;                       % Nombre de points
X1 = fft(s1,M);                 % FFT du signal 1
X1abs = abs(X1);                % abs de la fft du signal 1
X1absdB = 20*log10(X1abs);      % le gain en dB
f1 = 0:Fe1/(M-1):Fe1;           % fr�quences abscisse

% Construction du graphe

figure(1)
subplot(2,1,1)
plot(t1,s1)
xlabel('Temps en secondes')
ylabel('Volt (V)')
title('Signal 1')

subplot(2,1,2)
plot(f1,X1absdB)
xlabel('fr�quences')
ylabel('dB')
title('Module de la FTT du signal')

% Le signal est reconstruit de sorte � respecter le crit�re de
% Shannon, ie Fe>=2*fmax.
 
% Question C
Fe2 = 500;                      % Frequence du fondamental 2
Te2 = 1/Fe2;                    % p�riode d'�chantillonnage
t2 = 0:Te2:duree;               % temps d'�tude du signal 2
s2 = A*sin(2*pi*F0*t2);         % Signal d'etude
X2 = fft(s2,M);                 % FFT du signal 2
X2abs = abs(X2);                % abs de la fft du signal 2
X2absdB = 20*log10(X2abs);      % le gain en dB

f2 = 0:Fe2/(M-1):Fe2;           % fr�quences abscisse

% Construction du graphe

figure(2)
subplot(2,1,1)
plot(t2,s2)
xlabel('Temps en secondes')
ylabel('Volt (V)')
title('Signal 2')

subplot(2,1,2)
plot(f2,X2absdB)
xlabel('fr�quences')
ylabel('dB')
title('Module de la FTT du signal')

% On remarque que les signaux 1,2 et leurs modules respectifs de fft ont 
% globalement la m�me forme mais avec un intervalle de fr�quence beaucoup 
% plus petit pour le signal 2.En r�alit�, on a l'impression qu'il n'y a pas
% assez de points d'�chantillonnage pour le signal 2 et le module de son fft

% Question D
figure(3)
plot(t1,s1,'b',t2,s2,'mo')
xlabel('temps');
ylabel('signal s1 et s2');
title('Signaux s1 et s2');

% Le signal n'est pas assez �chantillon� pour le signal 2.
% On prend 2 cr�tes identiques pour identifier le motif sur s2
% Sur le motif, on compte 22 p�riodes pour s1 et 3 pour s2
% Donc il faudrait un signal s3 de fr�quence �gale � f3=F0/(22/3)
% ie environ �gale � F0/7.

% Question E 
% Si l'on d�s�chantillonne � la fr�quence fe2/2, on retrouverait un signal 
% non liss� et pas fid�le au signal s2 initial.
% Le signal n'est pas correctement reconstitu�. 
% Pour cause, la fr�quence d'�chantillonage fe2=0,5 KHz ne respecte pas le
% crit�re de Shannon. 

% Question F
% Le th�or�me de Shannon permet d'�chantillonn� correctement un signal. 
% On s�lectionne toutes les valeurs du signal � une fr�quence au moins 
% 2 fois sup�rieure � la fr�quence maximum de ce signal.

% Question G & H

[s,Fs] = audioread('../Signaux/bonjour.wav');   % importation du fichier
sound(s,Fs);                % �coute du signal
L = length(s);              % longueur du signal
pas = Fs/(L-1);             % pas de d'�chantillonnage
y = fft(s);                 % fft du signal
yabs = abs(y);              % abs de la fft du signal
f = 0:pas:Fs;               % fr�quence en abscisse
Ydb = 20*log10(yabs);       % module de la fft du signal

% La fr�quence d'�chantillonnage du signal est de 44100 Hz.

figure(4)
plot(f,Ydb)
xlabel('fr�quences')
ylabel('|Ydb| Module du signal')
title('Spectre du signal')

% L'occupation spectrale de ce spectrale est environ de 6500Hz. 


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