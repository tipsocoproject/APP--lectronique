%Question C

% Construction de la fonction porte telle qu'elle prenne
% la valeur 1 dans l'intervalle [0;0.05] et 0 partout ailleurs

t1 = 0.05;                          % Temps de fin du signal
Fe = 8000;                          % Frequence d'echantillonnage
Te = 1/Fe;                          % Periode d'echantillonnage
N1 = t1/Te;                         % Nombre d'echantillons
t = -0.1:1/Fe:0.1;                  % Vecteur de temps de visualisation du signal
y = zeros(size(t));                 % Affectations de zeros sur le vecteur temps
y(1:N1) = 1;                        % Exécution de la fonction porte sur l'intervalle [1;N1]

plot(t,y)
axis([-0.05 0.1 -1 2])
grid on

% Transformee de Fourier discrete
L=length(y);
N=ceil(log2(L));
fy=fft(y,2^N)/(L/2);
f=(Fe/2^N)*(0:2^(N-1)-1);
figure
plot(f,abs(fy(1:2^(N-1))));
axis([0 500 0 0.5])