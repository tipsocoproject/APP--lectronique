% Fonction de calcul et de representation graphique de la puissance moyenne
% de chaque echantillon du signal sur une fenetre temporelle : [-5*Te;5*Te]

function [t,P] = puisMoy(file)

    % Lecture du fichier audio avec x : matrice de taille(m,n)
    % et m : valeur des echantillons
    %   n : nombre de canaux audio
    %   Fe : frequence d'echantillonnage
    [x,Fe] = audioread(file);

    Te = 1/Fe;                      % Periode d'echantillonnage
        N = length(x);                  % Nombre d'echantillons dans un canal audio
    t = 0:Te:(N-1)*Te;              % Duree du signal
    P = zeros(1,43250);             % Preallocation de memoire
    P = x.^2;                       % Puissance instantanee sur chaque echantillon

    % Si quelqu'un arrive a calculer la puissance estimee... 
    Nmoy = 10;                      % Nombre d'echantillons dans la fenetre temporelle
    K = fix((3001-1)/2);            % Terme de fenêtre temporelle (2K+1)*Te
    PMoy = zeros(1,43519);          % Preallocation de memoire

    for n = K+1:N
        k = n-K:n+K;
        PMoy(n) = (1/(2*K+1))*sum(x(k).^2);
    end
    
    PdBm = zeros(1,43519);          % Preallocation de memoire
    PdBm = 10*log(PMoy/10^(-3));
    
    figure
    subplot(4,1,1)
    plot(t,x,'b')
    grid on
    xlabel('secondes')
    ylabel('Volt')
    title('Signal')
    subplot(4,1,2)
    plot(t,P,'g')
    grid on
    xlabel('secondes')
    ylabel('Watt')
    title('Puissance instantanee')
    subplot(4,1,3)
    plot(t,PMoy,'g')
    grid on
    xlabel('secondes')
    ylabel('Watt')
    title('Estimation de la puissance sur une fenetre glissante (W)')
    subplot(4,1,4)
    plot(t,PdBm,'g')
    grid on
    xlabel('secondes')
    ylabel('dBm')
    title('Estimation de la puissance sur une fenetre glissante (dBm)')
end