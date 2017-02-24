[x,Fe] = audioread('bonjour.wav');         % Lecture du fichier audio avec x : matrice de taille(m,n) avec m : valeur des échantillons et n : nombre de canaux audio; et Fe : fréquence d'échantillonnage
Te = 1/Fe;                      % Période d'échantillonnage
canalUn = transpose(x(:,1));               % Vecteur des échantillons du premier canal  
canalDeux = transpose(x(:,2));             % Vecteur des échantillons du second canal
ech = length(canalUn);          % Nombre d'échantillons d'un canal
ech150 = floor(0.15/Te)+1;      % Echantillon pris à environ t=150 ms
canalUnPropre = x(ech150:ech);  % Vecteur des échantillons pris entre t=150 ms et tfinal à la période Te
lenC = length(canalUnPropre);   % Nombre d'échantillons pris dans l'intervalle temps (s) = [0.15; tfinal] à la période Te
n = ech150:1:ech;               % Intervalle du nombre d'échantilons pris entre un intervalle de temps (s) [0.15; tfinal] àla période Te
A = double.empty;               % Création d'un vecteur vide qui sera le vecteur puissance

% Calcul de la puissance instantanée sur chaque échantillon du signal
for i=1:lenC
    K = (n(i) - ech150 + 1)/2    % Moyenne
    
    %                               PROBLEME A PARTIR DE CE POINT
    
    %syms j;                     % Indice de sommation         
    %puisEch = (1/(2*K + 1))*symsum(((canalUnPropre(j))^2), j, n(i) - K, n(i) + K);
    %A = horzcat(A, puisEch);     % Ajout de la puissance dans le vecteur vide
end

    
%figure
%plot(n,puisEch)
%xlabel('Temps (s)')
%ylabel('Puissance (W)')
%title('Signal')