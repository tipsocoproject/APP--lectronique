% Fonction de calcul et de representation graphique de la puissance moyenne
% de chaque echantillon du signal sur une fenetre temporelle (2*K+1)*Te

function [t,P] = puisMoy(file)

    % Lecture du fichier audio avec x : matrice de taille(m,n)
    % et m : valeur des echantillons
    %   n : nombre de canaux audio
    %   Fe : frequence d'echantillonnage
    [x,Fe] = audioread(file);

    Te = 1/Fe;                      % Periode d'echantillonnage
    N = length(x);                  % Nombre d'echantillons dans un canal audio
    t = 0:Te:(N-1)*Te;              % Duree du signal
    P = x.^2;                       % Puissance instantanee sur chaque echantillon

    % Terme de fenêtre temporelle (2K+1)*Te, choisi de maniere à ce que le
    % signal compris dans cet intervalle soit quasi-stationnaire
    K = floor(((10^(-1)*Te-Te))/(2*Te));
    PMoy = zeros(1,N);                 % Preallocation de memoire            

    %Calcul des
    for i = K+1:N
        k = i-K:i+K;
        PMoy(i) = (1/(2*K+1))*sum(x(k).^2);
    end
    
    PdBm = 10*log(PMoy/10^(-3));        % Conversion en dBm de la puissance estimee
    pres = (PdBm >= -50);               % Booléen qui rend 1 si la 
   
    % Tracé des graphiques
    figure
    % subplot(4,1,1)
    % plot(t,x,'b')
    % grid on
    % xlabel('secondes')
    % ylabel('Volt')
    % title('Signal')
    subplot(3,1,1)
    plot(t,PMoy,'g')
    grid on
    xlabel('secondes')
    ylabel('Watt')
    title('Estimation de la puissance sur une fenetre glissante (W)')
    subplot(3,1,2)
    plot(t,PdBm,'g')
    grid on
    xlabel('secondes')
    ylabel('dBm')
    title('Estimation de la puissance sur une fenetre glissante (dBm)')
    subplot(3,1,3)
    plot(t,pres,'r')
    grid on
    xlabel('secondes')
    ylabel('Presence')
    title('Presence')
end