
    % Lecture du fichier audio avec x : matrice de taille(m,n)
    % et m : valeur des echantillons
    %   n : nombre de canaux audio
    %   Fe : frequence d'echantillonnage
    [x,Fe] = audioread('chord1.wav');

    Te = 1/Fe;                      % Periode d'echantillonnage
    N = length(x);                  % Nombre d'echantillons dans un canal audio
    t = 0:Te:(N-1)*Te;              % Duree du signal
    P = x.^2;                       % Puissance instantanee sur chaque echantillon

    % Terme de fen�tre temporelle (2K+1)*Te, choisi de maniere � ce que le
    % signal compris dans cet intervalle soit quasi-stationnaire
    K = floor(((10^(-1)-Te))/(2*Te));
    PMoy = zeros(1,N);                 % Preallocation de memoire            

    for i = K+1:N-K
        k = i-K:i+K;
        PMoy(i) = (1/(2*K+1))*sum(x(k).^2);
    end
    
    PdBm = 10*log(PMoy/10^(-3));
    pres = (PdBm >= 0);
   
    % Trac� des graphiques pour la
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
    ylabel('Watt')
    title('Estimation de la puissance sur une fenetre glissante (dBm)')
    subplot(3,1,3)
    plot(t,pres,'r')
    grid on
    xlabel('secondes')
    ylabel('Presence')
    title('Presence')