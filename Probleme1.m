% Lecture du fichier audio avec x : matrice de taille(m,n)
    % et m : valeur des echantillons
    %   n : nombre de canaux audio
    %   Fe : frequence d'echantillonnage
[x,Fe] = audioread('bonjour.wav');

Te = 1/Fe;                      % Periode d'echantillonnage
N = length(x);                  % Nombre d'echantillons dans un canal audio
t = 0:Te:(N-1)*Te;              % Duree du signal


figure
subplot(2,1,1)
plot(t,x,'b')
grid on
xlabel('secondes')
ylabel('Volt')
title('Signal')
subplot(2,1,2)
plot(t,P,'g')
grid on
xlabel('secondes')
ylabel('Watt')
title('Puissance instantanee')
figure
plot(t,M)



