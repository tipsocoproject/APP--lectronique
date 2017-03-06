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
axis([0 8000 -10 70])            
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
axis([0 8000 -10 70])
grid on
subplot(2,1,2)
plot(f,10*log(Y3))              % Affichage en dB du signal Y3
axis([0 8000 -10 70])
grid on

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
plot(f,abs(fy(1:2^(N-1))))
axis([0 500 0 0.5])

% Question D
[x,Fe] = audioread('2notes.wav');   % Lecture du fichier audio
Te = 1/Fe;
N = length(x);                      % Nombre d'echantillons
f = 0:Fe/(N-1):Fe;                  % Intervalle de fréquence
t = 0:Te:(N-1)*Te;                  % Vecteur de temps
X = fft(x);                         % Transformee de Fourier du signal

% Graphe du signal
figure
plot(f,10*log(X))

% Question E
pas = 50;
nb = N/pas;
moyenne(1) = mean(X((1:pas)));
for k = 1:(nb-1)
    moyenne(k) = mean(X((k*pas):((k+1)*pas)));
end
figure
f1 = 0:Fe/3336:Fe;
plot(f1,moyenne)
