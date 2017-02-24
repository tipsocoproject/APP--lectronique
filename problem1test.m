[x,Fe] = audioread('bonjour.wav');         % Lecture du fichier audio avec x : matrice de taille(m,n) avec m : valeur des �chantillons et n : nombre de canaux audio; et Fe : fr�quence d'�chantillonnage
Te = 1/Fe;                      % P�riode d'�chantillonnage
canalUn = transpose(x(:,1));               % Vecteur des �chantillons du premier canal  
canalDeux = transpose(x(:,2));             % Vecteur des �chantillons du second canal
ech = length(canalUn);          % Nombre d'�chantillons d'un canal
ech150 = floor(0.15/Te)+1;      % Echantillon pris � environ t=150 ms
canalUnPropre = x(ech150:ech);  % Vecteur des �chantillons pris entre t=150 ms et tfinal � la p�riode Te
lenC = length(canalUnPropre);   % Nombre d'�chantillons pris dans l'intervalle temps (s) = [0.15; tfinal] � la p�riode Te
n = ech150:1:ech;               % Intervalle du nombre d'�chantilons pris entre un intervalle de temps (s) [0.15; tfinal] �la p�riode Te
A = double.empty;               % Cr�ation d'un vecteur vide qui sera le vecteur puissance

% Calcul de la puissance instantan�e sur chaque �chantillon du signal
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