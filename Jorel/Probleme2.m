% Probleme 2
% Algorithme de detection des notes

% Lecture du fichier audio et stockage de la frequence d'echantillonnage
% et de l'amplitude du signal en chaque echantillon
[x,Fe] = audioread('2notes.wav');

Te = 1/Fe;                          % Periode d'echantillonnage
N = length(x);                      % Nombre d'echantillons
f = 0:Fe/(N-1):Fe;                  % Intervalle de fréquence
t = 0:Te:(N-1)*Te;                  % Vecteur de temps
X = fft(x);                         % Transformee de Fourier du signal

% Recherche des notes par fréquence
q = 100;                            % Terme de fenetre glissante 
Nq = N/q;                           % Nombre d'echantillons sur une fenetre
Moy = mean(X((1:q)));               % Moyenne des fft sur une fenetre q
a = length(1:Nq);

for k = 1:(Nq-1)
    Moy(k) = mean(X((k*q):((k+1)*q)));
end

% Vecteur qui retiendra les frequences dont les amplitudes sont superieures
% a 2
tab = zeros(size(Nq));                    % Preallocation de memoire                 
            
for k = 1:Nq-1
    if(Moy(k) >= 2)
        tab(k) = Moy(k);
    end
end
figure
f1 = 0:Fe/length(1:length(tab)-1):Fe;
plot(f1,tab)
