% Probleme 2
% Algorithme de detection des notes

% Lecture du fichier audio et stockage de la frequence d'echantillonnage
% et de l'amplitude du signal en chaque echantillon
[x,Fe] = audioread('2notes.wav');

Te = 1/Fe;                          % Periode d'echantillonnage
N = length(x);                      % Nombre d'echantillons
f = 0:Fe/(N-1):Fe;                  % Intervalle de fréquence
t = 0:Te:(N-1)*Te;                  % Vecteur de temps

X = fft(x(1:0.15*Fe),N);                         % Transformee de Fourier du signal
Xabs = abs(X);
Pseuil = max(Xabs); %Puissance seuil bruit

K=1000;     %fenêtre glissante

testpresabs = zeros(1,N);


for n = 1+K:1:N-K
    xfen = x(n-K:n+K);
    X1 = fft(xfen);
    X1abs = abs(X1);

    %test de la présence du signal
    if X1abs<=Pseuil      %absent
        testpresabs(n-K)=0;
    else testpresabs(n-K)=1;%présent
    end
end
freq1 = mean(X1(27571:67418))
freq2 = mean(X1(106217:156846))

f1 = 0:Fe/length(1:length(tab)-1):Fe;

figure(1)
subplot(2,1,1)
plot(t,x,'b')
xlabel('temps en seconde')
ylabel('Volts')
title('signal 2note')

subplot(2,1,2)
plot(t,testpresabs,'r')
xlabel('temps en seconde')
ylabel('Présence/absence')
title('test de présence ou d absence')