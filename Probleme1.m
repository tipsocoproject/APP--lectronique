% Lecture du fichier audio avec x : matrice de taille(m,n)
    % et m : valeur des echantillons
    %   n : nombre de canaux audio
    %   Fe : frequence d'echantillonnage
[x,Fe] = audioread('bonjour.wav');

Te = 1/Fe;                      % Periode d'echantillonnage
N = length(x);                  % Nombre d'echantillons dans un canal audio
t = 0:Te:(N-1)*Te;              % Duree du signal
P = zeros(1,43250);             % Preallocation de memoire
P = x.^2;                       % Puissance instantanee sur chaque echantillon

% Si quelqu'un arrive a calculer la puissance estimee... 
Nmoy = 10;                      % Nombre d'echantillons dans la fenetre temporelle
K = fix((3001-1)/2);            % Terme de fenêtre temporelle (2K+1)*Te

for n=K+1:N
    k=n-K:n+K;
    PMoy(n)=(1/(2*K+1))*sum(x(k).^2);
end

figure
subplot(3,1,1)
plot(t,x,'b')
grid on
xlabel('secondes')
ylabel('Volt')
title('Signal')
subplot(3,1,2)
plot(t,P,'g')
grid on
xlabel('secondes')
ylabel('Watt')
title('Puissance instantanee')
subplot(3,1,3)
plot(t,PMoy,'g')
grid on
xlabel('secondes')
ylabel('Watt')
title('Estimation de la puissance sur une fenetre glissante')





